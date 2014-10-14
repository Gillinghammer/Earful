class HomeController < ApplicationController
  def index
    @user = current_user
    if @user
      redirect_to user_posts_path(@user)
    else
      redirect_to new_user_session_path
    end
  end
end
