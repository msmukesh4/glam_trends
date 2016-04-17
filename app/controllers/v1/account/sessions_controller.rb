require 'json'
class V1::Account::SessionsController < V1::BaseController

	def demo
		respond_to do |format|
			format.json {render :json => { status: "yes u are connected"} }
		end
	end
end