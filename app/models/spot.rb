class Spot < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :price, presence: true
  validates :availability, presence: true, inclusion: { in: [true, false] }
  validates :user_id, presence: true
  validates :photo, presence: true
  validates :address, presence: true
  validates :description, presence: true


  include PgSearch::Model
  pg_search_scope :search_by,
    against: [ :title, :description , :address],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
