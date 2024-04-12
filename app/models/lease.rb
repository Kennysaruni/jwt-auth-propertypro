class Lease < ApplicationRecord
  belongs_to :tenant
  belongs_to :unit
  belongs_to :owner
end
