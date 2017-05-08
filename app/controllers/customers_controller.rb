class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :send_reset_password, :change_user_points]
  before_action :verify_is_admin
  before_action :verify_is_super_admin, only: [:change_user_points]

  # GET /customers
  # GET /customers.json
  def index
    @q = Customer.ransack(params[:q])
    @customers = @q.result(distinct: true).order('created_at desc').paginate(:page => params[:page], per_page: 12)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @current_user = current_user
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  def change_user_points
    if points = params[:add_points]
      @customer.add_points(points.to_i)
      notice = "#{points} points were successfully added." 
    elsif points = params[:subtract_points]
      @customer.subtract_points(points.to_i)
      notice = "#{points} points were successfully subracted." 
    else 
      notice = 'Sorry, we were not able to perform operation' 
    end
    redirect_to @customer, notice: notice
  end

  def send_reset_password
    @customer.send_reset_password_instructions
    redirect_to @customer, notice: 'Password reset email was sent.'
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if verify_recaptcha(model: @customer) and @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end

    def verify_is_super_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.super_admin?)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.required(:customer).permit( :first_name, :last_name, :email)
    end
end
