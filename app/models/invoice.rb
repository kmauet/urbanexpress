class Invoice < ApplicationRecord
  include Payola::Sellable
  belongs_to :quote
  belongs_to :customer
  belongs_to :sales_rep, class_name: "User", foreign_key: "user_id"
  belongs_to :vehicule

  validates_presence_of :quote
  
  after_create :update_payola_info
  before_save :update_payola_price_info

  def update_payola_info
    self.name = "Invoice ##{self.id}" 
    self.permalink =  "invoice/#{self.id}"
    self.price = 100 * (self.rate || 0)
    self.save
  end

  # Turn price from dollars to cents b/c stripe assumes cents
  def update_payola_price_info
    self.price = 100 * (self.rate || 0)
  end
end
