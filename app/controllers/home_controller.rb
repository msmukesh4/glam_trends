class HomeController < ApplicationController

	before_action :confirm_logged_in
	# skip_authorization_check :only => [:index]
	layout 'admin_home' , only: [:index]

	def index
		
	end
end
