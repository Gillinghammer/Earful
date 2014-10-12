class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :public, :sound, :tags, :title, :sound_file_name
  has_attached_file :sound
  # validates_attachment_content_type :sound, :content_type => ['audio/mp4']
  #validates_attachment :sound_content_type, content_type: {content_type: ['audio/mp4']}
  # validates_attachment :sound, :presence => true,
    # :content_type => { :content_type => "audio/mp4" }
  validates_attachment_content_type :sound, :content_type => ['audio/mp4', 'audio/mp3', 'application/x-mp4']
end
