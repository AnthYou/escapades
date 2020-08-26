class Review < ApplicationRecord
  validates :user, uniqueness: { scope: :booking }
  belongs_to :booking
  belongs_to :user
end
