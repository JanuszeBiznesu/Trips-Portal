class CopiesController < ApplicationController


  	before_action :logged_in_user,     only: [:new, :update, :edit, :create, :destroy]
	
	def edit
    	@copy = Copy.find(params[:id])
    	@book = Book.find(@copy.book_id)
  	end

  	def new
  		@book = Book.find(params[:id])
 		@copy = Copy.new
 	end

	def create
		@copy = Copy.new(copy_params)
		@book = Book.find(params[:copy][:book_id])
		if @copy.save
		 	redirect_to @book
		else
		 	 render 'new'
		end
	end

  	def destroy
    	@copy = Copy.find(params[:id])
    	@book = Book.find(@copy.book_id)
    	@copy.destroy
    	flash[:success] = "Copy deleted"
    	redirect_to @book
  	end

 	def update
		@copy = Copy.find(params[:id])
		@book = Book.find(@copy.book_id)
		if @copy.update_attributes(copy_params)
	 	 	flash[:success] = "Copy updated"
	  		redirect_to @book
		else
	  		redirect_to action: 'edit', id: params[:id]
		end
	end

	def admin_user
    	redirect_to(books_url) unless logged_in? && current_user.admin?
  	end

	private

		    def copy_params
      			params.require(:copy).permit(:ISBN, :edition, :year_of_print, :book_id, :id)
    		end

end
