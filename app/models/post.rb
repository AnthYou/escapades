class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :trip
  has_one_attached :photo
end
