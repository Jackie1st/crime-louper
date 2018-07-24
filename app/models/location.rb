class Location < ApplicationRecord
	validates :title, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true

	geocoded_by :address
	after_validation :geocode 
end
