class PropertySerializer < ActiveModel::Serializer
  attributes :id, :property_name, :location
  belongs_to :owner
  has_many :units
  has_many :leases
end
