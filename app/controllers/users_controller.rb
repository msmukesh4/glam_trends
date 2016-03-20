class UsersController < ApplicationController
  
   layout "login", only: [:sign_in]
   layout "admin_home", only: [:index, :show, :edit, :new]
     
   def index
      @users = User.where(:status => "Active")
   end

   def sign_in
      # params.inspect
      @user = User.new()
   end

   def validate_user
      @user = User.new(user_sign_in_params)

      if @user.status == "Active"
         puts "user : #{@user.inspect}"

         u = User.where(:email => @user.email).first

         puts "user_extracted : #{u.inspect}"

         if u.blank?
            flash[:notice] = "user with email #{@user.email} doesnot exist"
            render('sign_in')
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
                     redirect_to(:controller => 'home',:action => 'index')
                  elsif u.is_owner
                     @user = User.find(u.id)
                     @user.last_logged_in = DateTime.now.utc
                     if @user.is_first_logged_in == false
                        @user.is_first_logged_in = true
                     end
                     @user.save
                     redirect_to(:controller => 'home',:action => 'index')
                  else
                     flash[:notice] = "User cannot log in !!"
                     render('sign_in')
                  end
               else
                  flash[:notice] = "confirm email"
                  render('sign_in')
               end
            else
              flash[:notice] = "Incorrect password"
              render('sign_in')
            end
         end
      else
         flash[:notice] = "User has been deleted"
      end
   end

   def new
      @user = User.new
   end

   def create
      
      @user = User.new(new_user_params)   
      if !@user.email.blank? and !@user.password.blank?
         @user.uuid = gen_uuid(@user.email)
         @user.password = encrypt(@user.password)
      end
      if @user.save
         flash[:notice] = "User successfully saved"
         redirect_to(:action => 'index')
      else
         flash[:notice] = "User creation unsuccessful"
         render('new')
      end
   end


   def show
      @user = User.find(params[:id])
   end

   def edit
      @user = User.find(params[:user])
   end

   def update
      @user =  User.find(params[:id])
      if @user.update_attributes(user_update_params)
         flash[:notice] = "User updated successfully"
         redirect_to(:action => 'index', :id => @user.id)
      else
        render('edit')
      end
   end

   def delete
      @user = User.find(params[:id])
   end

   def destroy
      user = User.find(params[:id])
      user.status = "Deactive"
      user.save
      flash[:notice] = "User #{user.email} destroyed successfully"
      redirect_to(:action => 'index')
   end

   private
      def user_sign_in_params
         params.require(:user).permit(:id,:first_name, :last_name, :password, :email, :contact_number1, :contact_number2, :is_owner,:loyality_discount_at, :user_last_location, :number_of_bookings)
      end
      def user_update_params
         params.require(:user).permit(:first_name, :last_name, :email, :contact_number1, :contact_number2, :loyality_discount_at, :user_last_location, :number_of_bookings)
      end
      def new_user_params
         params.require(:user).permit(:id,:first_name, :uuid, :last_name, :password, :email, :contact_number1, :contact_number2, :is_owner,:loyality_discount_at, :user_last_location, :number_of_bookings)
      end
end
