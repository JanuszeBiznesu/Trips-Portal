class PossessionsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

 	def create
    	user = Copy.find(params[:borrowed_id])
    	current_user.place_order(user)
    	redirect_to current_user
  	end

  	def destroy

 	end

  private

	    def logged_in_user
	      unless logged_in?
	        store_location
	        flash[:danger] = "Please log in."
	        redirect_to login_url
	      end
	    end

end
