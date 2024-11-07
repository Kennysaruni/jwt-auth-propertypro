class MaintenanceRequestSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :priority, :created_at, :updated_at
  belongs_to :unit
end
