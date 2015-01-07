class BooksController < ApplicationController

  	before_action :admin_user,     only: [:destroy]

 	def new
 		@book = Book.new
 	end

	def create
		@book = Book.new(book_params)
		if @book.save
		 	redirect_to books_url
		else
		 	 render 'new'
		end
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find(current_user.id) if logged_in?
		@copies = Copy.where(book_id: params[:id]).paginate(page: params[:page], :per_page => 10)
	end

	def update
		@book = Book.find(params[:id])
		if @book.update_attributes(book_params)
	 	 	flash[:success] = "Book updated"
	  		redirect_to @book
		else
	  		render 'edit'
		end
	end

	def index
		@books = Book.paginate(page: params[:page], :per_page => 10)
	end

	def edit
    	@book = Book.find(params[:id])
  	end

	private

		    def book_params
      			params.require(:book).permit(:title, :author, :amount, :synopsis, :picture)
    		end

end
