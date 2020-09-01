class Activity < ApplicationRecord
  TRANSPORT = ['plane', 'car']
  has_one_attached :photo
  geocoded_by :location
  belongs_to :trip
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :location, presence: true
  validates :transport_type, presence: true

  after_validation :geocode, if: :will_save_change_to_location?
end
