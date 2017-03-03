class Quote < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :customer
  
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  after_create :send_quote_confirmation

  def send_quote_confirmation
    QuoteMailer.quote_confirmation_email(self).deliver 
  end

  def email_token
    id.to_s + '-request'
  end
end
