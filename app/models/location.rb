class Location < ActiveRecord::Base
	has_many :spas
	has_many :sport_centres
	has_many :salons
	has_many :gyms
end
