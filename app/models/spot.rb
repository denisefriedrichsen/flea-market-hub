class Spot < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :title, presence: true, default: true
end
