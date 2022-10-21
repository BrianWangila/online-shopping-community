class User < ApplicationRecord
    has_secure_password

    validates :user_name, uniqueness: true
    validates :user_name, presence: true
end
