class AirportDropoffQuote < Quote

  def quote_fields
    [:first_name, :last_name, :email,  :phone_number, :departure_date, :airport, :departure_time, :departure_address, :flight_num, :additional_notes]
  end
end