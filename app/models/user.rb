class User < ActiveRecord::Base

	has_many :spas
	has_many :sport_centres
	has_many :salons
	has_many :gyms

	EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, :presence => true, :length => {:within => 3..200}, :uniqueness => true, :format => EMAIL_REGEX
	validates :first_name, :presence => true, :length => {:within => 1..100 }
	validates :uuid, :presence => true, :uniqueness => true

end
