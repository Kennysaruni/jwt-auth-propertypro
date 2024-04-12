class Tenant < ApplicationRecord
    has_one :unit, through: :lease
end
