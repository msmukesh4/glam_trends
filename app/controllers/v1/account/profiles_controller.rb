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
		booking_array = []
		if params[:u_uid]
			user = User.where(:uuid => params[:u_uid]).first
			if user
				# booking details
				if params[:b_uid]
					if booking_details(params[:b_uid])
						ts = @booking.time_slots.tr('[]', '')
						ts_start = ts.split(',').first
						ts_end = ts.split(',').last
						booking_duration = ts_end.to_i - ts_start.to_i
						e_time = @booking.date+booking_duration.hours
						booking_json = {
							:shop_name => @shop.name,
							:shop_location_id => @shop.location_id,
							:shop_address => @shop.address,
							:shop_contact_number1 => @shop.contact_number1,
							:shop_contact_number2 => @shop.contact_number2,
							:shop_latitude => @shop.latitude,
							:shop_longitude => @shop.longitude,
							:service_id => @service_type.id,
							:service_name => @service_type.name,
							:start_time => @booking.date,
							:end_time => e_time,
							:booking_token => @booking.booking_token,
							:cost => @booking.cost,
							:status => @booking.status
						}
						booking_array << booking_json
						respond_to do |format|
							format.json {render :json => { status: "true", booking: booking_json  } }
						end
					else
						respond_to do |format|
							format.json {render :json => { status: "false", reason: "Invalid booking ID"  } }
						end
					end
				# booking list
				else
					json_booking_array = ""
					bookings = Booking.where(:user_uuid => user.uuid)
					if bookings
						
						bookings.each do |booking|
							if booking_details(booking.uuid) 
								if !@shop.blank? and !@service_type.blank? and !@booking.blank?
									ts = @booking.time_slots.tr('[]', '')
									ts_start = ts.split(',').first
									ts_end = ts.split(',').last
									booking_duration = ts_end.to_i - ts_start.to_i
									e_time = @booking.date+booking_duration.hours
									puts "shopname : "+@shop.name
									puts @service_type.inspect
									puts @booking.inspect
									booking_json = {
										:shop_name => @shop.name,
										:shop_location_id => @shop.location_id,
										:shop_address => @shop.address,
										:shop_contact_number1 => @shop.contact_number1,
										:shop_contact_number2 => @shop.contact_number2,
										:shop_latitude => @shop.latitude,
										:shop_longitude => @shop.longitude,
										:service_id => @service_type.id,
										:service_name => @service_type.name,
										:start_time => @booking.date,
										:end_time => e_time,
										:booking_token => @booking.booking_token,
										:cost => @booking.cost,
										:status => @booking.status
									}
									booking_array << booking_json
								end
							end
							json_booking_array = JSON[booking_array]
						end
						respond_to do |format|
							format.json {render :json => { status: "true", booking: JSON[json_booking_array] } }
						end
					else
						respond_to do |format|
							format.json {render :json => { status: "true", reason: "user has no bookings"  } }
						end
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