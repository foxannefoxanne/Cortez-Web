class Pin < ActiveRecord::Base
  validates :longitude, :latitude, :presence => true 
  geocoded_by :address
  after_validation :geocode

  has_many :pictures, :dependent => :destroy 
  has_many :audios, :dependent => :destroy 
  has_many :videos, :dependent => :destroy 

  belongs_to :map
end
