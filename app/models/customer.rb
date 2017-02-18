class Customer < ApplicationRecord
  has_merit

  # Include default devise modules. Others available are:
  # :omniauthable, :lockable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #,:trackable,
         #:confirmable, :timeoutable

  def full_name
    (first_name || '') + ' ' + ( last_name || '')
  end
end
