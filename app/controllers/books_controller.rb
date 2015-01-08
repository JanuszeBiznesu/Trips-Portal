class BooksController < ApplicationController

  	before_action :admin_user,     only: [:new, :update, :edit]

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
		@copies = Copy.where(book_id: params[:id]).paginate(page: params[:page], :per_page => 30)
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
		@books = Book.paginate(page: params[:page], :per_page => 15)
	end

	def edit
    	@book = Book.find(params[:id])
  	end

   	def admin_user
    	redirect_to book_path(Book.find(params[:id])) unless logged_in? && current_user.admin?
  	end

	private

		    def book_params
      			params.require(:book).permit(:title, :author, :amount, :synopsis, :picture)
    		end

end
