class Customer < ApplicationRecord
  has_merit
  has_many :quotes
  has_many :messages
  has_many :invoices 
  
  # Include default devise modules. Others available are:
  # :omniauthable, :lockable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,:trackable, :timeoutable #,
         #:confirmable, :rememberable

  def full_name
    (first_name || '') + ' ' + ( last_name || '')
  end
end
