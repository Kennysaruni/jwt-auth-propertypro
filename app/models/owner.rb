class Owner < ApplicationRecord
    has_many :properties
    has_many :units, through: :properties
    has_many :leases
end
  