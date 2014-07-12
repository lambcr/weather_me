class Location < ActiveRecord::Base
  geocoded_by :address

  validates :address, presence: true

  after_validation :geocode, if: :address_changed?
end
