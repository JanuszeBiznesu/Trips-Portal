class SearchTripsController < ApplicationController

	def search
		query = params[:q]
		genre_id = params[:country_id]
		@books = Trip.tire.search(load: true, page: params[:page], per_page: 15) do 
			query do
				filtered do	
					query { string query, default_operator: "AND" } if query.present?
				end
			end
		end

	end
	
end
