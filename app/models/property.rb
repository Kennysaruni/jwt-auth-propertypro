class Property < ApplicationRecord
    belongs_to :owner
    has_many :units
    has_many :leases
end
