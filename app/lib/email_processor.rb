class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # all of your application-specific code here - creating models,
    # processing reports, etc

    # here's an example of model creation
    #quote_id = get_quote_id_from_subject(@email.subject)
    quote_id = Quote.last.id
    if quote_id.blank?
      #check_header_for_reply_to
      quote = Quote.create(info: @email.body)
    else
      quote = Quote.find(quote_id)
    end
     
    if not(quote.blank?) #and quote.email == @email.from
      Message.create!(
        body: @email.body,
        quote_id: quote.id
      )
    else
      random_message = Message.create(body: @email.body)
    end
  end
end

