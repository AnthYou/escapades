class Activity < ApplicationRecord
  geocoded_by :location
  belongs_to :trip
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :location, presence: true

  after_validation :geocode, if: :will_save_change_to_location?
end
