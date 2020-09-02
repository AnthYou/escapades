class User < ApplicationRecord
  acts_as_voter
  has_one_attached :photo
  validates :photo, presence: true
  has_many :trips, dependent: :destroy
  has_many :joined_trips, through: :bookings, source: :trip
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy # as reviewer
  has_many :received_reviews, through: :bookings, source: :reviews # as booking participant
  has_many :posts, dependent: :destroy
  has_many :notifications, dependent: :destroy, foreign_key: "receiver_id"
  has_many :messages, dependent: :destroy

  # Compute the average rating for a given user. Return an integer
  def user_average_rating
    if received_reviews.first.nil?
      return nil
    else
      total = 0
      received_reviews.each do |review|
        total += review.stars
      end
    end
    return (total.to_f / received_reviews.count).ceil
  end

  # Return true if an user is accepted in a trip
  def accepted_in?(trip_id)
    bookings.select{|booking| booking.status == "accepted"}.map{|booking| booking.trip.id}.include?(trip_id)
  end

  def applied_for?(trip_id)
    bookings.select{|booking| booking.status == "pending"}.map{|booking| booking.trip.id}.include?(trip_id)
  end

  def full_name
    first_name + " " + last_name
  end
end
