class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :properties
  has_many :leases
  has_many :units, through: :properties
end
