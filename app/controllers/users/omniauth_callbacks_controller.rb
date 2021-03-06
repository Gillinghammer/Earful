class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in @user#_and_redirect posts_path
        redirect_to user_posts_path(@user)
        # sign_in_and_redirect user_posts_path(@user)#, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

end