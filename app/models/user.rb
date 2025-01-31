class User < ApplicationRecord
    has_many :tasks
    validates :username, :email, :password, presence: true
end
