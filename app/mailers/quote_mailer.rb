class QuoteMailer < ApplicationMailer
  default :from => 'inof@urbanexpresscharter.com'



  def quote_message_email(message_id)

    @message = Message.find(message_id)
    if @message.owner == "customer"
      to_email = @message.quote.user.email
    else
      to_email = @message.quote.email
    end
    mail(:to => to_email,
      :from => @message.quote_email_token + '@urbanexpress.zesasoccer.com',
      :subject => "Quote Request") 
  end
end
