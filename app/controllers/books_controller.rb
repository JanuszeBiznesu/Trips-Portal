class BooksController < ApplicationController
	def show
    	@book = Book.find(params[:id])
  	end
  def index
    @books = Book.paginate(page: params[:page], :per_page => 10)
  end
end
