class Users::FeedsController < ApplicationController

  respond_to :json
  def followed
    puts "the current user is #{current_user}!!!"
    respond_with Post.from_users_followed_by(User.find(params[:user_id])).where(public: true) 
  end

  def fetch_users
    respond_with User.all #TODO fetch only the users you're not already following
  end

  def unfollow_user
    puts "the current user is #{current_user}!!!"
    respond_with current_user.unfollow!(params[:user_id])

  end

end