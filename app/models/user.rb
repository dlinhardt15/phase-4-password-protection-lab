class User < ApplicationRecord
    has_secure_password

    # validates :password_digest, length: {minimum: 8}
end