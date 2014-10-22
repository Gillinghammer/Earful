class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    user = User.find_by_email(@email.from[:email])
    if user
      new_post = Post.create!(title: @email.subject, content: @email.body, public: true)
      new_post.sound = @email.attachments[0]
    
      unless Post.find_by_title(new_post.title) && Post.find_by_user_id(new_post.user_id)
        user.posts << new_post
      end
    end
  end
end