class Quote < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :customer
  
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
end
