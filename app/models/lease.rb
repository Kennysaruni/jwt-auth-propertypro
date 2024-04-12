class Lease < ApplicationRecord
  belongs_to :tenant ,optional:true
  belongs_to :unit
  belongs_to :owner
end
