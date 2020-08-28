class User < ApplicationRecord
  has_one_attached :photo
  validates :photo, presence: true
  has_many :trips, through: :booking
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy

  has_many :reviews, dependent: :destroy # as reviewer
  has_many :received_reviews, through: :bookings, source: :reviews # as booking participant

  has_many :posts, dependent: :destroy
  has_many :trips, dependent: :destroy

  # Compute the average rating for a given user. Return an integer
  def user_average_rating
    if reviews.first == nil
      return nil
    else
      total = 0
      reviews.each do |review|
        total += review.stars
      end
    end
    return (total / reviews.count).to_i
  end
end
