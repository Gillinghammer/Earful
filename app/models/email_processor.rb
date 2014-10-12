class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process

    
    # all of your application-specific code here - creating models,
    # processing reports, etc
    new_post = Post.create!(title: @email.subject, content: @email.body)
    new_post.sound = @email.attachments[0]
    # here's an example of model creation
    user = User.find_by_email(@email.from[:email])
    user.posts << new_post
  end
end