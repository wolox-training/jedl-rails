class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  validates :email, uniqueness: true, email: true
  validates :password, confirmation: true
  validates :email, :first_name, :last_name, presence: true
end
