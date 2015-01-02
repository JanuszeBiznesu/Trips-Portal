require 'test_helper'

class BookTest < ActiveSupport::TestCase
	def setup
		@book = books(:Drach)
	end


  test "should be valid" do
    assert @book.valid?
  end

  test "title should be present" do
    @book.title = "     "
    assert_not @book.valid?
  end

  test "date of print should be present" do
    @book.date_of_print = "     "
    assert_not @book.valid?
  end


  test "author should be present" do
    @book.author = "     "
    assert_not @book.valid?
  end

  test "synopsis should be present" do
    @book.synopsis = "     "
    assert_not @book.valid?
  end

  test "amount should be above or equal 0" do
    @book.amount = 0
    assert @book.valid?
    @book.amount = -3
    assert_not @book.valid?
  end

end
