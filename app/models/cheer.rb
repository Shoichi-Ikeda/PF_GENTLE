# frozen_string_literal: true
class Cheer < ApplicationRecord
  belongs_to :user
  belongs_to :wine
  validates :wine_id, uniqueness: { scope: :user_id }
end
