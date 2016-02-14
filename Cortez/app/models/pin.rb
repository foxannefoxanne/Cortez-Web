class Pin < ActiveRecord::Base
  validates :longitude, :latitude, :presence => true 
  geocoded_by :address
  after_validation :geocode

  belongs_to :map
end
