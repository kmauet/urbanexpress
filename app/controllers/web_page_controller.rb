class WebPageController < ApplicationController
  # GET home
  def home
    @current_menu_item = "home"
  end

  def contact_us
    @current_menu_item = "contact_us"
  end

  def about_us
    @current_menu_item = "about_us"
  end

  def quote_request
    @quote = Quote.new
  end

  def create_quote_request
    @quote = Quote.new(quote_request_params)

    if @quote.save
      redirect_to quote_request_path, notice: 'Quote was successfully created.' 
    else
      render :new 
    end
  end

  def fleet
    @current_menu_item = "fleet"
    @type = params[:vehicule_type]
    if Vehicule.vehicule_types.keys.include?(@type)
      @vehicules = Vehicule.where(vehicule_type: @type)
    else
      @vehicules = Vehicule.all
    end
  end

  def services
    @current_menu_item = "services"
  end

  def profile_settings
    @current_menu_item = "profile"
    if current_customer.nil?
      raise ActionController::RoutingError.new('Not Found')
    else
      @current_customer = current_customer
    end
  end

  def update_profile_settings
    if current_customer.nil?
      raise ActionController::RoutingError.new('Not Found')
    end
    if current_customer.update(customer_params)
      redirect_to profile_settings_path, notice: 'Profile settings were successfully updated.' 
    else
      render "web_page/edit_profile_settings" 
    end
  end

  def edit_profile_settings
    @current_menu_item = "profile"
    if current_customer.nil?
      raise ActionController::RoutingError.new('Not Found')
    else
      @current_customer = current_customer
    end
  end

  def vehicule_details
    @current_menu_item = "fleet"
    @vehicule = Vehicule.find(params[:id])
    @other_vehicules = Vehicule.where(vehicule_type: @vehicule.vehicule_type) - [@vehicule]
  end

  def history
    @current_menu_item = "history"
    if current_customer.nil?
      raise ActionController::RoutingError.new('Not Found')
    else
      @current_customer = current_customer
    end
  end

  def jobs
    @current_menu_item = "jobs"
  end
  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone_number)
    end

    def quote_request_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :service_type, :vehicule_type, :number_of_people)
    end
end
