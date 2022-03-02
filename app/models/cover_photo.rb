class CoverPhoto < ApplicationRecord
    belongs_to :admin
    has_one_attached :image
    
    belongs_to :user
    has_one_attached :image
end
