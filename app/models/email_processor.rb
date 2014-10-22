class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    user = User.find_by_email(@email.from[:email])
    if user
      if Post.find_by_title(@email.subject) && Post.find_by_user_id(user.id)
        puts "Alert! this file has already been uploaded"
      else 
        new_post = Post.create!(title: @email.subject, content: @email.body, public: true)
        new_post.sound = @email.attachments[0]
        user.posts << new_post
      end
    end
  end
end