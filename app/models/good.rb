# frozen_string_literal: true
class Good < ApplicationRecord
  attr_accessor :keyword
  validates :keyword, presence: true, length: { in: 2..20 }

  def self.fetch_items_from_rakuten(keyword)
    RakutenWebService::Ichiba::Item.search(keyword: keyword)
  end
end
