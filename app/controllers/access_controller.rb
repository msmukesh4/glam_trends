class AccessController < ApplicationController
  
   layout "login", only: [:login]
   before_action :confirm_logged_in, :except	=> [:login, :validate_user, :index, :logout ]
   # skip_authorization_check :only => [:index, :login, :validate_user, :logout]
   
   def login
      
   	@user = User.new
      # flash[:notice] = ""
	end

	def index
		
	end

	# function to validate user
   def validate_user
   	authorized_user = nil
      @user = User.new(user_sign_in_params)
      # @user = User.find(:id => temp_user.id)
      # @user = User.find(params[:id])

      if @user.status == "Active"
         puts "user : #{@user.inspect}"

         u = User.where(:email => @user.email).first
         # puts "user_extracted : #{u.inspect}"

         if u.blank?
            flash[:notice] = "user with email #{@user.email} doesnot exist"
         else
            d_pass = decrypt(u.password)
            # puts "#{d_pass}"
            if d_pass == @user.password
               if u.is_first_logged_in
                  if u.is_super_user
                     @user = User.find(u.id)
                     @user.last_logged_in = DateTime.now.utc
                     if @user.is_first_logged_in == false
                        @user.is_first_logged_in = true
                     end
                     @user.save
                     authorized_user = @user
                  elsif u.is_owner
                     @user = User.find(u.id)
                     @user.last_logged_in = DateTime.now.utc
                     if @user.is_first_logged_in == false
                        @user.is_first_logged_in = true
                     end
                     @user.save
                     authorized_user = @user
                  else
                     flash[:notice] = "User cannot log in !! only admin/owner can"
                  end
               else
               	u.is_first_logged_in = true
                  flash[:notice] = "confirm email"
               end
            else
              flash[:notice] = "Incorrect password"
            end
         end
      else
         flash[:notice] = "User has been deleted"
      end
      if authorized_user
      	# TODO: mark user as logged in
      	session[:user_id] = authorized_user.id
      	session[:email] = authorized_user.email
      	
	      flash[:notice] = "You are now logged in."
	      redirect_to(:controller => 'home', :action => 'index')
      else
         if !u.blank?
            puts "increasing failed attempts #{@user.failed_attempts}"
         	u.failed_attempts += 1
            puts "failed_attempts : #{@user.failed_attempts}"
            u.save
         end
         render('login')
      end
   end

   def logout
   	# TODO: mark user as logged out
   	session[:user_id] = nil
      session[:email] = nil
      	
	   flash[:notice] = "Logged out"
	   redirect_to(:action => "login")
   end

   private
   	def user_sign_in_params
         params.require(:user).permit(:id,:first_name, :last_name, :password, :email, :contact_number1, :contact_number2, :is_owner,:loyality_discount_at, :user_last_location, :number_of_bookings)
      end

end
