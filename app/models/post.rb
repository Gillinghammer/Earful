class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :public, :sound, :tags, :title
  has_attached_file :sound
  validates_attachment :sound, content_type: {content_type: ['audio/mp4']}
end
