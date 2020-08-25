class User < ApplicationRecord
    before_validation { email.downcase! }
    has_secure_password

    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    has_many :image_posts
    has_many :favorites, dependent: :destroy
    has_many :favorite_image_posts, through: :favorites, source: :image_post
    mount_uploader :profile, ProfileUploader
end
