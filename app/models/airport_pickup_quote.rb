class AirportPickupQuote < Quote
  def quote_fields
    [:first_name, :last_name, :email,  :phone_number, :departure_date, :airport, :departure_time, :departure_address, :flight_num, :pay_method, :additional_notes]
  end
end