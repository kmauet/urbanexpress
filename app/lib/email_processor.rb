class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # quote request subject Quote Request (#32355)
    quote_id = get_quote_id_from_subject(@email.to.first[:token])
    @from_email = @email.from[:email]
    user = User.find_by(email: @from_email)
    customer = Customer.find_by(email: @from_email)

    if is_number?(quote_id)
      #only trust quote_id if email comming from original customer or urbanexpress user
      begin
        quote = Quote.find(quote_id)
        quote_email = quote.email
      rescue
        quote = nil
      end
      if quote and (quote_email == @email.from[:email] or user) 
        #quote was found and user/custome email checks out
        message = create_message_from_email(@email, quote.id, user, customer)
      else
        #quote not found
        message = create_message_from_email(@email, nil, user, customer)
      end
      
    else
      #check_header_for_reply_to
      quote = Quote.create(email: @email)
      message = create_message_from_email(@email, quote.id, user, customer)
    end
    
  end

  private
    def get_quote_id_from_subject(token)
      quote_id = token.split('-').first #subject.match(/\(#([0-9]+)\)/)[1]
    end

    def create_message_from_email(email, quote_id, user, customer)
      # Use redcarpet gem for markdown?
      # Use gravatar
      # local tunnel
      # return 200
      Message.create!(
        body: Sanitize.fragment(email.body, Sanitize::Config::RELAXED),
        quote_id: quote_id,
        to: email.to,
        from: email.from,
        cc: email.cc,
        subject: email.subject,
        raw_text: Sanitize.fragment(email.raw_text, Sanitize::Config::RELAXED),
        raw_html: Sanitize.fragment(email.raw_html, Sanitize::Config::RELAXED),
        raw_body: Sanitize.fragment(email.raw_body, Sanitize::Config::RELAXED),
        attachments: email.attachments,
        headers: email.headers,
        raw_headers: email.raw_headers,
        user_id: user.try(:id),
        customer_id: customer.try(:id)
      )
    end
    def is_number? string
      true if Float(string) rescue false
    end
end

