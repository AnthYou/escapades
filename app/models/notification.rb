class Notification < ApplicationRecord
  belongs_to :booking
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
end
