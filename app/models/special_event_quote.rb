class SpecialEventQuote < Quote
   def quote_fields
    [:first_name, :last_name, :email, :phone_number, :num_of_passengers, :additional_notes, :departure_date,  
      :departure_time, :departure_address, :total_num_of_days,  :return_time, :destination_address, :itinirary, :vehicule_type]
  end
end
