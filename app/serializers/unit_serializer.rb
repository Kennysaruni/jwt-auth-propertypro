class UnitSerializer < ActiveModel::Serializer
  attributes :id, :unit_type, :rent_amount, :rooms, :bathrooms
  belongs_to :property
end
