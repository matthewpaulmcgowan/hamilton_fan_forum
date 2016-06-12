class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :authored_posts, :Serializer => PostSerializer
end
