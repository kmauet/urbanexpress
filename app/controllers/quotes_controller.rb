class QuotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quote, only: [:show, :edit, :update, :destroy, :update_quote_assigned_user]

  # GET /quotes
  # GET /quotes.json
  def index
    @q = Quote.ransack(params[:q])
    @quotes = @q.result(distinct: true).order('updated_at desc').paginate(:page => params[:page], per_page: 12)
    @users_select = User.all.map {|u| [u.email, u.id]}
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @messages = @quote.messages
    @message = @quote.messages.build
    #@message.user_id = current_user.try(:id)
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_message
    @message = Message.new(message_params)
    @message.user_id = current_user.try(:id)
    if @message.save
      redirect_to quote_path(@message.quote.id), notice: 'Message was successfully created.'
    else
      render "quotes/new" 
    end
  
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_quote_assigned_user
    respond_to do |format|
      if not(quote_params[:user_id].blank?) and @quote.update(quote_params)
        format.html { redirect_to quotes_path, notice: 'User was successfully assigned.' }
        @quote.send_quote_assignment_notice
      else
        flash[:error] = "Sorry, unable to assign user."
        format.html { redirect_to quotes_path }
        #format.html { render :edit }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body, :quote_id, :user_id, :customer_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      if params[:airport_pickup_quote]
        result = params.require(:airport_pickup_quote)
      elsif params[:airport_dropoff_quote]
        result = params.require(:airport_dropoff_quote)
      elsif params[:out_of_town_quote]
        result = params.require(:out_of_town_quote)
      elsif params[:contract_quote]
        result = params.require(:contract_quote)    
      else
        result = params.require(:contact_us_quote)
      end
      result.permit(:first_name, :last_name, :email, :phone_number, :service_type, :type, :customer_id, 
            :organization, :address, :extension, :departure_date, :departure_time, :departure_address, 
            :destination_address, :vehicule_type, :itinirary, :additional_notes, :total_num_of_days, :return_date, 
            :return_time, :num_of_passengers, :num_of_bags, :airport, :flight_num, :pay_method, :flight_departure_time, :user_id)
    end
end
