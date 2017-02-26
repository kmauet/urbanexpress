class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :quotes
  # Let the first declared role be the default.
  enum role: [:basic, :admin, :super_admin]

  def admin?
    return admin == true
  end
end
