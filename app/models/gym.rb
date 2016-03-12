class Gym < ActiveRecord::Base
	belongs_to :offer
	belongs_to :user
	belongs_to :location
end
