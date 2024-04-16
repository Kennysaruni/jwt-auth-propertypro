class MaintenanceRequest < ApplicationRecord
  belongs_to :unit
  belongs_to :tenant
end
