class SearchTripsController < ApplicationController

  def search
    @params = params
    query = params[:q] || ""
    genre = params[:country_id] || ""
    if query != ""
      @trips = Trip.tire.search(load: true, page: params[:page], per_page: 15) do 
        query do
          string query
        end
        filter :term, :country_id => genre if genre != "" && genre != "0"
      end
    else
      if genre != "0"
        @trips = Trip.where(:country_id => genre).paginate(page: params[:page], :per_page => 10)
      else
        @trips = Trip.all.paginate(page: params[:page], :per_page => 10)
      end
    end
  end

end
