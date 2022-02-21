class User < ApplicationRecord
    has_secure_password

    validates :name, length: { minimum: 2, maximum: 50 }, presence: true
    validates :email, presence: true
    validates :bio, length: { minimum: 2, maximum: 500 }, presence: true
end
