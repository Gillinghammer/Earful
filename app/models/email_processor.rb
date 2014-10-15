class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    new_post = Post.create!(title: @email.subject, content: @email.body)
    new_post.sound = @email.attachments[0]
    user = User.find_by_email(@email.from[:email])
    user.posts << new_post  if user
  end
end