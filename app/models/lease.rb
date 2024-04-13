class Lease < ApplicationRecord
  belongs_to :unit
  belongs_to :tenant 
  belongs_to :owner
  # has_one :property, through: :unit
end
