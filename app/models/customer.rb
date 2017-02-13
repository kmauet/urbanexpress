class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable, :lockable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable

  def full_name
    (first_name || '') + ' ' + ( last_name || '')
  end
end
