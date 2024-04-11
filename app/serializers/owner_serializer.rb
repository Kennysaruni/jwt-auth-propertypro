class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :properties
end
