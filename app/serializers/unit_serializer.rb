class UnitSerializer < ActiveModel::Serializer
  attributes :id, :unit_type, :rent_amount, :rooms, :bathrooms, :property_id
  belongs_to :property
  has_one :lease
  has_one :tenant, through: :lease
  has_many :maintenance_requests
end
