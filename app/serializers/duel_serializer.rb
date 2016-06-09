class DuelSerializer < ActiveModel::Serializer
  attributes :id, :competitor, :user_id, :outcome
end
