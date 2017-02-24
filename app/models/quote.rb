class Quote < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
end
