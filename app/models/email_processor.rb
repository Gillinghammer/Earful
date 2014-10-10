class EmailProcessor
  def self.process(email)
    # Post.create!({ content: email.body, title: email.subject,  })
        user = User.find_by_email(@email.from[:email])
        user.posts.create!(
          title: @email.subject,
          content: @email.body,
          public: true,
          sound: @email.attachments[0]
        )

  end
end