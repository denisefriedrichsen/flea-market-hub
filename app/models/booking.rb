class Booking < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  validates :date, presence: true
  validates :user_id, presence: true
  validates :spot_id, presence: true
  validates :status, presence: true, inclusion: { in: ["pending", "declined", "confirmed"] }
end
