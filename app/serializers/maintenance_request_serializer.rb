class MaintenanceRequestSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status:, :priority
end
