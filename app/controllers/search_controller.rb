class SearchController < ApplicationController
  before_action :authenticate_user!

	def research
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Wine.search_for(@content, @method)
		end
	end
end