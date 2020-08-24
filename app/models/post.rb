class Post < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_one_attached :photo
end
