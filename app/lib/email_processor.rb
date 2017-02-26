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
        quote_id: quote.id,
        to: @email.to,
        subject: @email.subject,
        raw_text: @email.raw_text,
        raw_html: @email.raw_html,
        raw_body: @email.raw_body,
        attachments: @email.attachments,
        headers: @email.headers,
        raw_headers: @email.raw_headers
      )
    else
      random_message = Message.create(body: @email.body)
    end
  end
end
