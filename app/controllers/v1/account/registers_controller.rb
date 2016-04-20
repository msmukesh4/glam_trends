require 'json'
class V1::Account::RegistersController < V1::BaseController

	skip_before_action :verify_authenticity_token, only: [:user]

	def user
		puts params.inspect
		n_user = User.new
		if params[:email] and params[:password] and params[:firstname] and params[:lastname] and params[:contact_number]
			n_user.email = params[:email]
			n_user.password = encrypt(params[:password])
			n_user.first_name = params[:firstname]
			n_user.last_name = params[:lastname]
			n_user.contact_number1 = params[:contact_number]
			n_user.uuid = gen_uuid(params[:email])
			puts n_user.inspect
			if n_user.save
				respond_to do |format|
					format.json {render :json => { status: "true", role: "appuser", uid: "#{n_user.uuid}" } }
				end
			else
				respond_to do |format|
					format.json {render :json => { status: "false", reason: "Exception while saving user"} }
				end
			end
		else
			respond_to do |format|
				format.json {render :json => { status: "false", reason: "email,password,contact_number,firstname,lastname cannot be blank"} }
			end
		end
	end

end