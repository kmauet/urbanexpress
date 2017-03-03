class ContractQuote < Quote
  def quote_fields
    [:first_name, :last_name, :email,  :phone_number, :organization, :extension, :additional_notes]
  end
end