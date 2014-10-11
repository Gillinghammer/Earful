class EmailProcessor
  
  def self.process(email)
      Post.create!({ title: "this is a test" content: email.body })
  end


  # def self.process(email)
  #   # Post.create!({ content: email.body, title: email.subject,  })
  #     puts
  #     puts "----!!!---"
  #     puts "processing new email now..."
  #     puts "----!!!---"
  #     puts
  #       user = User.find_by_email(@email.from[:email])
  #       user.posts.create!(
  #         title: @email.subject,
  #         content: @email.body,
  #         # public: true,
  #         # sound: @email.attachments[0]
  #       )
  # end
end