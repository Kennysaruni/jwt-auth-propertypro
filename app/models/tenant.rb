class Tenant < ApplicationRecord
    has_one :lease
    has_one :unit, through: :lease
    has_many :maintenance_requests
end
