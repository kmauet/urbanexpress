class OutOfTownQuote < Quote
  def quote_fields
    [:first_name, :last_name, :email,  :phone_number, :organization, :airport, :num_of_passengers, :departure_date, :departure_time,
     :departure_address, :total_num_of_days, :return_date, :return_time, :destination_address, :itinirary, :additional_notes]
  end
end