class Cheer < ApplicationRecord
  belongs_to :user
  belongs_to :wine
  validates_uniqueness_of :wine_id, scope: :user_id
end
