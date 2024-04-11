class UnitSerializer < ActiveModel::Serializer
  attributes :id, :type, :rent_amount, :rooms, :bathrooms
end
