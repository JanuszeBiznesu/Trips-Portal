class SearchUsersController < ApplicationController

	def search
	  if params[:q].nil?
	    @articles = []
	  else
	    @articles = User.search params[:q]
	  end
	end

end
