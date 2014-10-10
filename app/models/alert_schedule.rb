class AlertSchedule < ActiveRecord::Base
  geocoded_by :address
  validates :address, presence: true

  belongs_to :creator, class_name: "User"

  after_validation :geocode, if: :address_changed?
end
