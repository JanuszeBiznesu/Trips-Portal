require 'test_helper'

class BookIndexTest < ActionDispatch::IntegrationTest

  test "index should display correctly, admin will be able to edit and erase book, user won't" do
    
    @book = books(:Drach)
    @admin = users(:michael)

	get books_path
    assert_template 'books/index'
     first_page_of_books = Book.paginate(page: 1, per_page: 15)
    first_page_of_books.each do |book|
      assert_select 'a[href=?]', book_path(book)
    end
    assert_select 'div.container'

	assert_select 'a[href=?]', new_book_path, count: 0
    get book_path(@book)
    assert_select 'a[href=?]', edit_book_path(@book), count: 0
    assert_difference 'Book.count', 0 do
      delete book_path(@book)
    end
    
    log_in_as(@admin)
    get books_path
	assert_select 'a[href=?]', new_book_path
	get book_path(@book)
	assert_select 'a[href=?]', edit_book_path(@book)
    assert_difference 'Book.count', -1 do
      delete book_path(@book)
    end
    
  end

end
