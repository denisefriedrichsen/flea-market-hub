class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :spots
  has_one_attached :photo
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true, uniqueness: true

end
