class LeaseSerializer < ActiveModel::Serializer
  attributes :id, :tenant_id, :unit_id
end
