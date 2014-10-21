class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :user_name, :image
end
