class Users::FeedsController < ApplicationController

  respond_to :json
  def followed
    respond_with Post.from_users_followed_by(User.find(params[:user_id])).where(public: true) 
  end

  def fetch_users
    respond_with User.all
  end

end