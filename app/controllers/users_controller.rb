class UsersController < ApplicationController
  
  layout "login", only: [:sign_in]
  def index
  end

  def sign_in
    params.inspect
    @user = User.new()
    if validate_user(@user.email)
      flash[:notice] = "You Logged In !!"
      redirect_to(:controller => 'home', :action => 'index')
    else
      render('sign_in')
    end
  end

  def validate_user(email)
    u_email = params[:email]

    u = User.where(:email => u_email)
    if u.blank?
        flash[:notice] = "user with email #{@user.email} doesnot exist"
        return false
    else
      if u.password == @user.password
        return true
      else
        flash[:notice] = "Incorrect password"
        return false
      end
    end
  end

  def new
  end

  def show
  end

  def edit
  end

  def delete
  end
end
