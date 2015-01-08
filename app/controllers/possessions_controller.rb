class PossessionsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :update]

 	def create
    	@copy = Copy.find(params[:borrowed_id])
    	current_user.place_order(@copy)
    	redirect_to book_path(@copy.book_id)
  	end

  	def destroy
  		@possession = Possession.find(params[:id]).destroy
  		@book = Book.find(Copy.find(@possession.borrowed_id).book_id)
  		@possession.destroy
  		redirect_to @book
 	end

 	def edit
 		@possession = Possession.find(params[:id])
		@book = Book.find(Copy.find(@possession.borrowed_id).book_id)
		action = @possession.specifier == "pending" ? "active" : "delete"
		if action == "active"
			if @possession.update_attributes(specifier: action)
		 	 	flash[:success] = "Book order activated"
			end
			redirect_to @book
		else
			@possession.destroy
			redirect_to @book
		end
 	end


	def update
		@possession = Possession.find(params[:id])
		@book = Book.find(Copy.find(@possession.borrowed_id).book_id)
		if @possession.update_attributes(book_params)
	 	 	flash[:success] = "Book updated"
		else
			flash[:success] = "Book did not update correctly"
		end
		redirect_to @book
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
