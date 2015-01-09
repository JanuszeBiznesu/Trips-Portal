require 'test_helper'

class CopyActionsTest < ActionDispatch::IntegrationTest

  test "copies will display correctly, admin will be able to edit and erase copies, user won't" do
    
    @copy = copies(:One)
    @admin = users(:michael)
    @book = books(:Drach)


    get book_path(@book)
    assert_select 'a[href=?]', edit_copy_path(@copy), count: 0
	assert_select 'a[href=?]', new_copy_path, count: 0
    assert_select 'a[href=?][value="Delete"]', copy_path(@book), count: 0

    log_in_as(@admin)
	get book_path(@book)
    assert_select 'a[href=?]', edit_copy_path(@copy)
	assert_select 'a[href=?]', new_copy_path+"?id=#{@book.id}"
    assert_select 'a[href=?]', copy_path(@book)
    assert_select 'input[value="Delete"]'
  end

end
