class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :public, :sound, :tags, :title
end
