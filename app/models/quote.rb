class Quote < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :customer
  has_many :invoices
  belongs_to :vehicule, class_name: "Vehicule", foreign_key: "vehicule_type"
  
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  after_create :send_quote_confirmation

  scope :by_user, ->(id) { where("user_id = ?", id)  }

  def send_quote_confirmation
    QuoteMailer.quote_confirmation_email(self).deliver 
  end

  def send_quote_assignment_notice
    QuoteMailer.quote_assignment_email(self).deliver 
  end

  def email_token
    id.to_s + '-request'
  end

  def quote_fields
    [:first_name, :last_name, :email, :phone_number, :organization, :extension, :additional_notes, :departure_date, :airport, 
      :departure_time, :departure_address, :flight_num, :pay_method, :num_of_passengers, :total_num_of_days, :return_date, :return_time, 
      :destination_address, :itinirary]
  end

  def full_name
    (first_name || '') + ' ' + ( last_name || '')
  end
end
