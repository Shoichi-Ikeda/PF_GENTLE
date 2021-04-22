class GoodsController < ApplicationController
  def search
    @items = RakutenWebService::Ichiba::Item.search(title: params[:keyword]) if params[:keyword]
  end
end
