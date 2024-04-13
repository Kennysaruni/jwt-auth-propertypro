class LeaseSerializer < ActiveModel::Serializer
  attributes :id, :tenant_id, :unit_id
  belongs_to :tenant
  belongs_to :unit 
  belongs_to :owner
end
