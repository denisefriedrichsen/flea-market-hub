class Spot < ApplicationRecord
  has_one_attached :photo

  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :price, presence: true
  validates :availability, presence: true, inclusion: { in: [true, false] }
  validates :user_id, presence: true
  validates :photo, presence: true
end
