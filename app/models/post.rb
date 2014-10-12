class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :public, :sound, :tags, :title, :sound
  mount_uploader :sound, SoundUploader
end
