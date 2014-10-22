class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    user = User.find_by_email(@email.from[:email])
    if user
      new_post = Post.create!(title: @email.subject, content: @email.body, public: true)
      new_post.sound = @email.attachments[0]
    
      user.posts << new_post  if user
    end
  end
end