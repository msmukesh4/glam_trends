class UsersController < ApplicationController
  
   before_action :confirm_logged_in
   layout "login", only: [:sign_in]
   layout "admin_home", only: [:index, :show, :edit, :new, :delete]
     
   def index
      @users = User.all
      
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
      @user = User.find(params[:id])
      puts @user.inspect
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
      def user_update_params
         params.require(:user).permit(:first_name, :last_name, :email, :contact_number1, :contact_number2, :loyality_discount_at, :user_last_location, :number_of_bookings)
      end
      def new_user_params
         params.require(:user).permit(:id,:first_name, :uuid, :last_name, :password, :email, :contact_number1, :contact_number2, :is_owner,:loyality_discount_at, :user_last_location, :number_of_bookings)
      end

end
