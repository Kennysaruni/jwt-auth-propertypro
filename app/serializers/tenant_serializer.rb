class TenantSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_one :unit, through: :lease
end
