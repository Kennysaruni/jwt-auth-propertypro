class UnitSerializer < ActiveModel::Serializer
  attributes :id, :unit_type, :rent_amount, :rooms, :bathrooms
  belongs_to :property
  has_many :maintenance_requests
  has_one :lease
  has_one :tenant, through: :lease
end
