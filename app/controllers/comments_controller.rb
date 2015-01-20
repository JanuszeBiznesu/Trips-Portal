class CommentsController < ApplicationController

  	before_action :logged_in_user,     only: [:new, :update, :edit, :create, :destroy]
	
	def edit
    	@comment = Comment.find(params[:id])
    	@trip = Trip.find(@comment.trip_id)
  	end

  	def new
  		@trip = Trip.find(params[:id])
 		@comment = Comment.new
 	end

	def create
		@comment = Comment.new(comment_params)
		@trip = Trip.find(params[:comment][:trip_id])
		if @comment.save
		 	redirect_to @trip
		else
		 	 render 'new'
		end
	end

  	def destroy
    	@comment = Comment.find(params[:id])
    	@trip = Trip.find(@comment.trip_id)
    	@comment.destroy
    	flash[:success] = "Copy deleted"
    	redirect_to @trip
  	end

 	def update
		@comment = Comment.find(params[:id])
		@trip = Trip.find(@comment.trip_id)
		if @comment.update_attributes(comment_params)
	 	 	flash[:success] = "Copy updated"
	  		redirect_to @trip
		else
	  		redirect_to action: 'edit', id: params[:id]
		end
	end

	def admin_user
    	redirect_to(trips_url) unless logged_in? && current_user.admin?
  	end

	private

		    def comment_params
      			params.require(:comment).permit(:text, :user_id, :trip_id, :grade)
    		end

end

