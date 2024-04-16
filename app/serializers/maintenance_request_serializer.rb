class MaintenanceRequestSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :priority
  belongs_to :unit
end
