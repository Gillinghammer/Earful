class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :public, :sound, :tags, :title, :sound, :user_id, :location # TODO remove user_id
  mount_uploader :sound, SoundUploader
  delegate :user_name, to: :user
  delegate :id, :to => :user, :prefix => true

  default_scope order: 'posts.created_at DESC'

  # Return microposts from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

     # Return an SQL condition for users followed by the given user.
     # We include the user's own id as well.
     def self.followed_by(user)
       following_ids = %(SELECT followed_id FROM relationships
                  WHERE follower_id = :user_id)
       where("user_id IN (#{following_ids})",{ user_id: user })
     end

end
