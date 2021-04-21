class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :wine
  validates :comment, presence: true
end
