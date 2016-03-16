class UsersController < ApplicationController
  
   layout "login", only: [:sign_in]
   layout "admin_home", only: [:index, :show, :edit, :new]
     
   def index
      @users = User.all
   end

   def sign_in
      params.inspect
      @user = User.new()
   end

   def validate_user
      @user = User.new(user_sign_in_params)

      u = User.where(:email => @user.email).first
      if u.blank?
         flash[:notice] = "user with email #{@user.email} doesnot exist"
         render('sign_in')  
      else
         if u.password == @user.password
            if @user.is_first_logged_in
               if @user.is_super_user
                  redirect_to(:controller => 'home',:action => 'index')
               elsif @user.is_owner
                  redirect_to(:controller => 'home',:action => 'index')
               else
                  flash[:notice] = "confirm email"
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
   end

   def new
      @user = User.new
   end

   def create
      @user = User.new(new_user_params)
      @user.uuid = "123123123"
      if @user.save
         flash[:notice] = "User successfully saved"
         redirect_to(:action => 'index')
      else
         flash[:notice] = "User creation unsuccessful"
         render('new')
      end
   end

   def show

   end

   def edit
      @user = User.find(params[:id])
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
   end

   def destroy
      
   end

   private
      def user_sign_in_params
         params.require(:user).permit(:email,:password)
      end
      def user_update_params
         params.require(:user).permit(:first_name, :last_name, :email, :contact_number1, :contact_number2, :loyality_discount_at, :user_last_location, :number_of_bookings)
      end
      def new_user_params
         params.require(:user).permit(:first_name, :last_name, :password, :email, :contact_number1, :contact_number2, :is_owner,:loyality_discount_at, :user_last_location, :number_of_bookings)
      end
end
