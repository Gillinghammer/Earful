class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :public, :sound, :tags, :title, :sound, :user_id, :location # TODO remove user_id
  mount_uploader :sound, SoundUploader
end
