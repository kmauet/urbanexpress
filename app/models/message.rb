class Message < ApplicationRecord
  belongs_to :quote
  belongs_to :user
  belongs_to :customer

  serialize :email_hash, Hash
  serialize :to, Array 
  serialize :from, Hash
  serialize :cc, Array 
  serialize :attachments, Array 
  serialize :headers, Hash 

  after_create :send_message_quote_email, unless: :skip_callbacks

  def owner
    return "none" if quote_id.nil?
    return "customer" if quote.email == self.from[:email]
    return "user" unless user_id.nil?
    return "none"
  end

  def send_message_quote_email
    QuoteMailer.quote_message_email(self).deliver unless type.nil? #don't send emails if no type is set
   end
end
