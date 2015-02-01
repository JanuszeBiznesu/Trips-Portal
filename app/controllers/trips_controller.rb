class TripsController < ApplicationController
  	before_action :logged_in_user,     only: [:new, :update, :edit, :create, :destroy]

 	def new
 		@trip = Trip.new
   		@trip_attachment = @trip.trip_attachments.build
 	end

	def create
		@trip = Trip.new(trip_params)
		respond_to do |format|
		 if @trip.save
		   if params[:trip_attachments]  && params[:trip_attachments]
			   params[:trip_attachments]['avatar'].each do |a|
			      @trip_attachment = @trip.trip_attachments.create!(:avatar => a, :trip_id => @trip.id)
			   end
		   end
		   format.html { redirect_to @trip, notice: 'Post was successfully created.' }
		 else
		   format.html { render action: 'new' }
		 end
		end
	end

	def show
		@trip = Trip.find(params[:id])
		@user = User.find(current_user.id) if logged_in?
		@copies = Comment.where(trip_id: params[:id]).paginate(page: params[:page], :per_page => 30)
		@trip_attachments = @trip.trip_attachments.all
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
		@trip_attachments = @trip.trip_attachments.all
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
      			params.require(:trip).permit(:title, :grade, :user_id, :text, :country_id, trip_attachments_attributes: [:id, :trip_id, :avatar])
    		end

end

