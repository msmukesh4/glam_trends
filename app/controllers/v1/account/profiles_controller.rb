require 'json'
class V1::Account::ProfilesController < V1::BaseController

	skip_before_action :verify_authenticity_token, only: [:user_details,:edit_user,:update_password,:user_bookings]

	def user_details
		if params[:uid]
			user = User.where(:uuid => params[:uid]).first
			if user
				respond_to do |format|
					format.json {render :json => { status: "true", firstname: user.first_name, lastname: user.last_name, email: user.email, contact_number: user.contact_number1, location: user.user_last_location, discounts_at: user.loyality_discount_at } }
				end
			else
				respond_to do |format|
					format.json {render :json => { status: "false", reason: "user not found"} }
				end
			end
		else
			respond_to do |format|
				format.json {render :json => { status: "false", reason: "Please enter user uid"} }
			end
		end
	end

	def edit_user
		puts params.inspect
		if params[:uid]
			user = User.where(:uuid => params[:uid]).first
			if user
				user.email = params[:email]
				user.first_name = params[:firstname]
				user.last_name = params[:lastname]
				user.contact_number1 = params[:contact_number]
				if user.save
					respond_to do |format|
						format.json {render :json => { status: "true", reason: "user updated" } }
					end
				else
					respond_to do |format|
						format.json {render :json => { status: "false", reason: "Exception while saving user" } }
					end
				end
			else
				respond_to do |format|
					format.json {render :json => { status: "false", reason: "user not found"} }
				end
			end
		else
			respond_to do |format|
				format.json {render :json => { status: "false", reason: "Please enter user uid"} }
			end
		end
	end

	def update_password
		if params[:email] and params[:old_password] and params[:new_password]
			user = User.where(:email => params[:email]).first
			if user
				if params[:old_password] == decrypt(user.password)
					user.password = encrypt(params[:new_password])
					if user.save
						respond_to do |format|
							format.json {render :json => { status: "true", reason: "password updated" } }
						end
					else
						respond_to do |format|
							format.json {render :json => { status: "false", reason: "unable to update user" } }
						end
					end
				else
					respond_to do |format|
						format.json {render :json => { status: "false", reason: "invalid old password" } }
					end
				end
			else
				respond_to do |format|
					format.json {render :json => { status: "false", reason: "user not found"} }
				end
			end
		else
			respond_to do |format|
				format.json {render :json => { status: "false", reason: "Please enter user email, old password and new password"} }
			end
		end
	end

	def user_bookings
		if params[:uid]
			user = User.where(:uuid => params[:uid]).first
			if user
				bookings = Booking.where(:user_uuid => user.uuid)
				if bookings
					bookings.each do |booking|
						# bookings.service_type == "gym"
						respond_to do |format|
							format.json {render :json => { status: "true", reason: "booking list"  } }
						end
					end
						respond_to do |format|
							format.json {render :json => { status: "true", reason: "user has no bookings"  } }
						end
				else
					respond_to do |format|
						format.json {render :json => { status: "true", reason: "user has no bookings"  } }
					end
				end
			else
				respond_to do |format|
					format.json {render :json => { status: "false", reason: "user not found"} }
				end
			end
		else
			respond_to do |format|
				format.json {render :json => { status: "false", reason: "Please enter user uid"} }
			end
		end
	end

	def template
		if params[:uid]
			user = User.where(:uuid => params[:uid]).first
			if user
				respond_to do |format|
					format.json {render :json => { status: "true" } }
				end
			else
				respond_to do |format|
					format.json {render :json => { status: "false", reason: "user not found"} }
				end
			end
		else
			respond_to do |format|
				format.json {render :json => { status: "false", reason: "Please enter user uid"} }
			end
		end
	end

end