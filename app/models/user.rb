class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: {csse_sensitive: false}
end
