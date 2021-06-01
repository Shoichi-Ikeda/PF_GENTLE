# frozen_string_literal: true
class Good < ApplicationRecord
  attr_accessor :keyword
  validates :keyword, presence: true, length: { in: 2..20 }
end
