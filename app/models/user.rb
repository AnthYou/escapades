class User < ApplicationRecord
  has_one_attached :photo
  validates :photo, presence: true
  has_many :bookings
  has_many :trips, through: :booking
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :bookings, dependent: :destroy

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
    return (total.to_f / reviews.count).ceil
  end
end
