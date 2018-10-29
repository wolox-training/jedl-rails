class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  include DeviseTokenAuth::Concerns::User

  validates :password, confirmation: true
  validates :first_name, :last_name, presence: true

  has_many :rents, dependent: :destroy
  has_many :books, through: :rents
end
