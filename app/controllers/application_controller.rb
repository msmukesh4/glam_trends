class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # for cancan ability.rb
  # this will force the controllers to check the ability for each action
  check_authorization
  skip_authorization_check :only => [:gen_uuid, :encrypt, :confirm_logged_in]

  helper_method :gen_uuid, :encrypt, :decrypt

  ALGORITHM = 'AES-128-ECB'
  KEY = "abckey123aaaaaa1" # must me >= 16

  # to generate uuid
  # format uuid = 201503123452ASasle
  def gen_uuid(sub_string = nil)
  	u = ""
  	now = DateTime.now.utc.to_s(:number)

  	if sub_string != nil
  		u = now + sub_string
  	end
  	if u.length < 20
  		random_s = SecureRandom.hex(3)
  		u = now + random_s
  	end
  	uuid = u.first(20)
  	
  	uuid
  end

  # this will ecript the data based on the key and Algorithm type
  def encrypt(data)
    
    cipher = OpenSSL::Cipher.new(ALGORITHM)
    cipher.encrypt()
    cipher.key = KEY
    crypt = cipher.update(data) + cipher.final()
    encrypted_data = (Base64.encode64(crypt))
    
    encrypted_data
  end

  # this will ecript the data based on the key and Algorithm type
  def decrypt(data)

    cipher = OpenSSL::Cipher.new(ALGORITHM)
    cipher.decrypt()
    cipher.key = KEY
    tempkey = Base64.decode64(data)
    decrypted_data = cipher.update(tempkey)
    decrypted_data << cipher.final()
      	
    decrypted_data
  end

  rescue_from CanCan::AccessDenied do |exception|
    pust "Access Denied !! 302"
    redirect_to(:controller => 'access', :action => 'index')
  end


  private

    def confirm_logged_in
      puts session.inspect
      unless session[:user_id]
        flash[:notice] = "Please login !!"
        redirect_to(:controller => 'access', :action => 'login')
        return false
      else
        return true
      end
    end

end
