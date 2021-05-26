# frozen_string_literal: true
class GoodsController < ApplicationController
  def search
    if params[:keyword]
      items = Good.new(keyword: params[:keyword])
      if items.valid?
        @items = Good.fetch_items_from_rakuten(items.keyword)
      else
        flash[:search_danger] = '※検索ワードを入力してください'
        redirect_to request.referer
      end
    end
  end
end
