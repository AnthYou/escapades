class Activity < ApplicationRecord
  TRANSPORT = ['Plane', 'Car']
  has_one_attached :photo
  geocoded_by :city
  belongs_to :trip
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :city, presence: true
  validates :country, presence: true
  validate :check_trip_date

  after_validation :geocode, if: :will_save_change_to_city?

  private

  def check_trip_date
    if (start_date < trip.departure_date ) || ( end_date >= trip.return_date )
      errors.add(:return_date, "must be included into the trip period")
    end
  end
end
