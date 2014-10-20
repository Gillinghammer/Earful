class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :public, :sound, :tags, :title, :sound, :location, :user_name, :user_id, :created_at

end
