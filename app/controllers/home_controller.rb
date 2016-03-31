class HomeController < ApplicationController

	before_action :confirm_logged_in
	layout 'admin_home' , only: [:index]

	def index
		
	end
end
