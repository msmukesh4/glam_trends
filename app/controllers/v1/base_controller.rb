class V1::BaseController < ApplicationController
#   before_filter :set_current_user

# private

#   def set_current_user
#     if doorkeeper_token
#       @current_user ||= User.find(doorkeeper_token.resource_owner_id)
#     end
#     current_user = @current_user
#     current_user
#   end
  
   def auth_user(credential)
      # @current_user = 
   end

end