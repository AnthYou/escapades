class Trip < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :activities, dependent: :destroy
  has_many :posts
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :destination, presence: true
  validates :budget_min, presence: true
  validates :budget_max, presence: true
  validates :departure_date, presence: true
  validates :return_date, presence: true
  validates :max_capacity, presence: true, numericality: { greater_than: 1 }
  validates :photo, presence: true

  #compute the number of days left before departure
  def days_to_departure
    (departure_date - Date.today).to_i
  end

  # count the number of accepted bookings for a given trip
  def num_of_bookings_accepted
    bookings.where(status: "accepted").count
  end

  # return an array of a given trip's participants (EXCLUDING owner)
  def mates
    mates = []
    bookings.where(status: "accepted").each do |booking|
      mates << booking.user
    end
    return mates
  end

# return an array of a given trip's participants (INCLUDING owner)
  def participants
    participants = [user]
    bookings.where(status: "accepted").each do |booking|
      participants << booking.user
    end
    return participants
  end

  # Compute the average rating for a given trip (for all accepted users and the owner). Return an integer
  def trip_average_rating
    total = 0
    participants.each do |participant|
      total += participant.user_average_rating
    end
    return total / participants.count
  end
end
