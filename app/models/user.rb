class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
<<<<<<< HEAD
<<<<<<< HEAD
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable
=======
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
=======
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable
>>>>>>> UPDATE

  include DeviseTokenAuth::Concerns::User
>>>>>>> UPDATE

  validates :email, uniqueness: true, email: true
  validates :password, confirmation: true
  validates :first_name, :last_name, presence: true

  has_many :rents, dependent: :destroy
  has_many :books, through: :rents
end
