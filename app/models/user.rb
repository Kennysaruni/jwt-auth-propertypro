class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: {csse_sensitive: false}
    validates :email, uniqueness:true, presence: true
    validates :user_type, inclusion: {in: %w(Owner Tenant)}
end
