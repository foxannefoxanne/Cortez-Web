class Pin < ActiveRecord::Base

  validates_numericality_of :longitude, :latitude, allow_nil: true 

  validate :address_xor_latlong

  geocoded_by :address
  after_validation :geocode

  has_many :pictures, :dependent => :destroy 
  has_many :audios, :dependent => :destroy 
  has_many :videos, :dependent => :destroy 

  belongs_to :map


  private
  	def address_xor_latlong
  		if(!address.blank? ^ (longitude.blank? && latitude.blank?))
  			errors[:base] << "Specify an address or latitude and longitude!"
  		end
  	end

end
