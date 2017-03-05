class ContactUsQuote < Quote
  def quote_fields
    [:first_name, :last_name, :email, :phone_number, :additional_notes]
  end
end