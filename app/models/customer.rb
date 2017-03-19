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
         :recoverable, :validatable,:trackable, :timeoutable,
         :confirmable#, :rememberable

  def full_name
    (first_name || '') + ' ' + ( last_name || '')
  end

  def password_match?
     self.errors[:password] << "can't be blank" if password.blank?
     self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
     self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
     password == password_confirmation && !password.blank?
  end

  # new function to set the password without knowing the current 
  # password used in our confirmation controller. 
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # Devise::Models:unless_confirmed` method doesn't exist in Devise 2.0.0 anymore. 
  # Instead you should use `pending_any_confirmation`.  
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
  
  def has_invoices_due?
    invoices.where(payed: nil).count > 0 
  end

  # Make password not be required for customers that are being created by administrators
  def password_required?
   new_record? ? false : super
  end
end
