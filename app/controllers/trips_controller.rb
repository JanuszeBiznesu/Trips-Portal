class TripsController < ApplicationController
  	before_action :logged_in_user,     only: [:new, :update, :edit, :create, :destroy]

 	def new
 		@trip = Trip.new
 	end

	def create
		@trip = Trip.new(trip_params)
		if @trip.save
		 	redirect_to trips_url
		else
		 	 render 'new'
		end
	end

	def show
		@trip = Trip.find(params[:id])
		@user = User.find(current_user.id) if logged_in?
		@copies = Comment.where(trip_id: params[:id]).paginate(page: params[:page], :per_page => 30)
	end

	def update
		@trip = Trip.find(params[:id])
		if @trip.update_attributes(trip_params)
	 	 	flash[:success] = "Trip updated"
	  		redirect_to @trip
		else
	  		render 'edit'
		end
	end

	def destroy
		Trip.find(params[:id]).destroy
	    Trip.tire.index.delete
	    Trip.tire.import
	    Trip.tire.index.refresh
		redirect_to trips_path
	end

	def index
		@trips = Trip.paginate(page: params[:page], :per_page => 15)
	end

	def edit
    	@trip = Trip.find(params[:id])
  	end

   	def admin_user
   		if not logged_in? && current_user.admin?
	   		if params[:id]
	    		redirect_to trip_path(Trip.find(params[:id])) 
	    	else
	    		redirect_to trips_path unless logged_in? && current_user.admin?
	    	end
	    end
  	end

	private

		    def trip_params
      			params.require(:trip).permit(:title, :grade, :user_id, :text, :country_id)
    		end

end

