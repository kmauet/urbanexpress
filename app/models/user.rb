class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :quotes
  has_many :messages
  has_many :invoices
  
  # Let the first declared role be the default.
  enum role: [:basic, :admin, :super_admin]

  def admin?
    return admin == true
  end

  def full_name
    (first_name || '') + ' ' + ( last_name || '')
  end

  # Make password not be required for users that are being created by administrators
  def password_required?
   false
  end
end
