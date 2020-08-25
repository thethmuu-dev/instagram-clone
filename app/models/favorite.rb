class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :image_post
    validates :user_id, presence: true
end
