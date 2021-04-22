class GoodsController < ApplicationController
  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(title: params[:keyword])
    end
  end
end