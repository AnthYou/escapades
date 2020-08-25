class User < ApplicationRecord
  has_one_attached :photo
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
end
