require 'json'
class V1::Account::SessionsController < V1::BaseController

	skip_before_action :verify_authenticity_token, only: [:login]

	def demo
		respond_to do |format|
			format.json {render :json => { status: "yes u are connected"} }
		end
	end

	def login

		puts "#{params[:email]},#{params[:password]},#{params[:session]}"	
		email = params[:email]
		password = params[:password]
		result = auth(email,password) 
		if result
			respond_to do |format|
				format.json {render :json => { status: "true", role: "#{@role}", user_uid: "#{@user_uid}" } }
			end
		else
			respond_to do |format|
				format.json {render :json => { status: "false", reason: "#{@reason}"} }
			end
		end
	end

	private
		# checks that user in the database or not
		# if not returns false
		# else returns true
		def auth(email,password)
			u = User.where(:email => email).first
			if u.blank?
				@reason = "user does not exist !!"
			else
				if decrypt(u.password) == password  # user auth success
					if u.is_owner # user is owner
						@role = "owner"
					elsif u.is_super_user
						@role = "super_user"
					else
						@role = "appuser"
					end
					if !u.is_first_logged_in
						u.is_first_logged_in = true
					end
					
					@user_uid = u.uuid
					u.last_logged_in = DateTime.now.utc
					return true
				else
					@reason	= "incorrect password !!"
				end
			end
			return false
		end
end