class MaintenanceRequest < ApplicationRecord
  belongs_to :unit
  enum status: { new: 0, in_progress: 1, completed: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }
end
