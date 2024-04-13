class TenantSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_one :lease
  has_one :unit, through: :lease
end
