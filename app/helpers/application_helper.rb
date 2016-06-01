module ApplicationHelper
	
	def confirm_logged_in
      # puts session.inspect
      unless session[:user_id]
        flash[:notice] = "Please login !!"
        redirect_to(:controller => 'access', :action => 'login')
        return false
      else
        return true
      end
   end
   
end
