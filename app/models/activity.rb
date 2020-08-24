class Activity < ApplicationRecord
  belongs_to :trip
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :location, presence: true
end
