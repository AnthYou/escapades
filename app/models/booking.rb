class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :reviews
  has_many :notifications, dependent: :destroy
  validates :user, uniqueness: { scope: :trip }

  after_save :create_booking_notif

  def create_booking_notif
    if self.status == "accepted"
      Notification.create(content: "Congratulations #{self.user.full_name}! You have been accepted in: #{self.trip.title}",
                          receiver: self.user,
                          booking: self)
    elsif self.status == "pending"
      Notification.create(content: "#{self.user.full_name} made a request to join your trip: #{self.trip.title}",
                          receiver: self.trip.user,
                          booking: self)
    end
  end
end
