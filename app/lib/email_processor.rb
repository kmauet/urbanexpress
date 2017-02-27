class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # quote request subject Quote Request (#32355)
    quote_id = get_quote_id_from_subject(@email.subject)
    @from_email = @email.from[:email]
    user = User.find_by(email: @from_email)
    customer = Customer.find_by(email: @from_email)

    if quote_id.blank?
      #check_header_for_reply_to
      create_message_from_email(@email, nil, user, customer)
    else
      #only trust quote_id if email comming from original customer or urbanexpress user
      quote = Quote.find(quote_id)
      quote_email = quote.try(:email) || ""
      if quote_email == @email.from[:email] or not(user.blank?)
        create_message_from_email(@email, quote.id, user, customer) 
      end
    end
    
     
    
  end

  private
    def get_quote_id_from_subject(subject)
      quote_id = subject.match(/\(#([0-9]+)\)/)[1]
    end

    def create_message_from_email(email, quote_id, user, customer)
      # Use redcarpet gem for markdown?
      Message.create!(
        body: sanitize email.body,
        quote_id: quote_id,
        to: email.to,
        from: email.from,
        cc: email.cc,
        subject: email.subject,
        raw_text: sanitize email.raw_text,
        raw_html: sanitize email.raw_html,
        raw_body: sanitize email.raw_body,
        attachments: email.attachments,
        headers: email.headers,
        raw_headers: email.raw_headers,
        user_id: user.try(:id),
        customer_id: customer.try(:id)
      )
    end
end

