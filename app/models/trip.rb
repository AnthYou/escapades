class Trip < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :applications
  has_many :activities
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
end
