class SearchTripsController < ApplicationController

  def search
    @params = params
    query = params[:q] || ""
    genre = params[:country_id] || ""
    @trips = Trip.tire.search(load: true, page: params[:page], per_page: 15) do 
      query do
        string query
      end
      filter :term, :country_id => genre if genre != "" && genre != "0"
    end
  end

end
