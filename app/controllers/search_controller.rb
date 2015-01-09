class SearchController < ApplicationController

	def search
		if params[:q].nil?
			@books = []
		else
			@books = Book.search(params[:q]).paginate(page: params[:page], :per_page => 15)
		end
	end
	
end