class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # all of your application-specific code here - creating models,
    # processing reports, etc

    # here's an example of model creation
    #user = User.find_by_email(@email.from[:email])
    quote_id = get_quote_id_from_subject(@email.subject)
    if quote_id.blank?
      check_header_for_reply_to
      quote = Quote.create(info: email.body)
    else
      quote = Quote.find(quote_id)
    end
     
    if not(quote.blank?) and quote.email == @email.from
      Message.create!(
        body: @email.body,
        quote_id: quote.id
      )
    else
      quote = Quote.create(info: email.body)
    end
  end
end

