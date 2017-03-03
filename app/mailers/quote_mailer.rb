class QuoteMailer < ApplicationMailer
  default :from => 'inof@urbanexpresscharter.com'



  def quote_message_email(message)
    @message = message
    if @message.owner == "customer"
      to_email = @message.quote.user.email
    else
      to_email = @message.quote.email
    end
    mail(:to => to_email,
      :from => @message.quote.email_token + '@urbanexpress.zesasoccer.com',
      :subject => "Quote Request") 
  end

  def quote_confirmation_email(quote)
    @quote = quote
    to_email = @quote.email
    mail(:to => to_email,
      :from => @quote.email_token + '@urbanexpress.zesasoccer.com',
      :subject => "Quote Request") 
  end
end
