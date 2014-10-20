class RelationshipsController < ApplicationController
  #before_filter :authenticate

  def create
    @relationship = Relationship.new(params[:relationship])
    respond_to do |format|
      if @relationship.save
        format.json { render json: @relationship, status: :created, location: @relationship }
      else
        format.html { render action: "new" }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to @user
  end
end