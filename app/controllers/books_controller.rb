class BooksController < ApplicationController

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
	end

	def index
		@books = Book.paginate(page: params[:page], :per_page => 10)
	end

	private

		    def book_params
      			params.require(:book).permit(:title, :author, :year_of_print, :amount, :synopsis, :picture)
    		end

end
