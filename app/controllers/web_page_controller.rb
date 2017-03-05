class WebPageController < ApplicationController
  # GET home
  def home
    @current_menu_item = "home"
  end

  def contact_us
    @current_menu_item = "contact_us"
    @contact_us_quote = ContactUsQuote.new
  end

  def about_us
    @current_menu_item = "about_us"
  end

  def quote_request
    @current_menu_item = "request_quote"
    @airport_pickup_quote = AirportPickupQuote.new
    @airport_dropoff_quote = AirportDropoffQuote.new
    @out_of_town_quote = OutOfTownQuote.new
    @contract_quote = ContractQuote.new
  end

  def create_contact_us_quote_request
    @contact_us_quote = ContactUsQuote.new(quote_request_params)
    if @contact_us_quote.save
      redirect_to quote_success_page_path, notice: "Message was successfully sent. You will be receiving an email confirmation shortly at this email: #{@contact_us_quote.email}"       
    else
      render :contact_us 
    end
  end

  def create_quote_request
    
    if quote_request_params[:type] == "AirportPickupQuote"
      @quote = @airport_pickup_quote = AirportPickupQuote.new(quote_request_params)
      save_result = @airport_pickup_quote.save
    elsif quote_request_params[:type] == "AirportDropoffQuote"
      @quote = @airport_dropoff_quote = AirportDropoffQuote.new(quote_request_params)
      save_result = @airport_dropoff_quote.save
    elsif quote_request_params[:type] == "OutOfTownQuote"
      @quote = @out_of_town_quote = OutOfTownQuote.new(quote_request_params)
      save_result = @out_of_town_quote.save   
    else
      @quote = @contract_quote = ContractQuote.new(quote_request_params)
      save_result = @contract_quote.save
    end

    if save_result
      redirect_to quote_success_page_path, notice: "Quote was successfully created. You will be receiving an email confirmation shortly at this email: #{@quote.email}" 
    else
      @current_menu_item = "request_quote"
      @airport_pickup_quote = AirportPickupQuote.new unless @airport_pickup_quote
      @airport_dropoff_quote = AirportDropoffQuote.new unless @airport_dropoff_quote
      @out_of_town_quote = OutOfTownQuote.new unless @out_of_town_quote
      @contract_quote = ContractQuote.new unless @contract_quote
      render :quote_request 
    end
  end

  def quote_success_page 

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
            :return_time, :num_of_passengers, :num_of_bags, :airport, :flight_num, :pay_method, :flight_departure_time)
    end
end
