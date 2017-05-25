class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy, :send_invoice_notification_email]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.quote_id = params[:quote_id]
    random_num = rand(1..10000)
    @invoice.name = "placeholder-#{random_num}"
    @invoice.permalink = "placeholder-#{random_num}"
    @invoice.price = 0
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    authorize @invoice
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_invoice_notification_email
    @invoice.send_invoice_notification
    @invoice.update_attributes(emailsent: true)
    redirect_to @invoice, notice: 'Invoice email notification was sent.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:price, :permalink, :name, :quote_id, :customer_id, :date_reserved, :date_needed, :user_id, :first_name,
        :last_name, :phone, :email, :itinerary, :handicap_accessible, :public_availability, :method_of_pay, :rate, :sales_tax, :deposit, :amount_due,
        :additional_charges, :total_collected, :time_reserved, :vehicule_id, :accepted, :unit)
    end
end
