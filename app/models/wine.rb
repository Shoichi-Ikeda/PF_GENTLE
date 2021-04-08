class Wine < ApplicationRecord
  belongs_to :user
  attachment :wine_image
end
