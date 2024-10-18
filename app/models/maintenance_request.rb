class MaintenanceRequest < ApplicationRecord
  belongs_to :unit
  belongs_to :tenant

  before_create :set_default_status, :set_default_priority

  private

  def set_default_status
    self.status ||='Open'
  end

  def set_default_priority
    self.priority ||='High'
  end

end
