class User < ApplicationRecord
    has_secure_password

    #a user has many posts
    #has_many :posts

    #a user has a user page
    has_one_attached:avatar

    #validations added
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
