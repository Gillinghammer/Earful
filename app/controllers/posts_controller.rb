class PostsController < ApplicationController
 
  respond_to :json

  def index
    @user = User.find(params[:user_id]) if params[:user_id]
    if @user
      @my_posts = @user.posts
      #@followed_posts = @user.following.first.posts #TODO fix this to return all posts of followed user
    end
    @all_posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      
      format.json do
        
        [(@my_posts||[]), @all_posts].each do |collection|
          collection.map! { |post| PostSerializer.new(post).as_json['post'] }
        end

        render json: { my_posts: @my_posts, all_posts: @all_posts }
      end

    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path(current_user), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { render json: @post }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
