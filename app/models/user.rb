class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :email, uniqueness: true, email: true
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :email, :password, :first_name, :last_name, presence: true
end
