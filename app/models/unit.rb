class Unit < ApplicationRecord
  belongs_to :property
  has_one :lease
  has_one :tenant, through: :lease
end
