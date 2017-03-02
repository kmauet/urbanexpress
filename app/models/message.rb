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

  after_create :send_message_quote_email
  def owner
    return "customer" unless customer_id.nil?
    return "user" unless user_id.nil?
    return "none"
  end

  def quote_email_token
    quote.id.to_s + '-request'
  end

  def send_message_quote_email
    QuoteMailer.quote_message_email(self).deliver 
  end
end
