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

  test "genre id should be present" do
    @book.genre_id = "     "
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

  test "Book can be searched with correct data" do
    assert Book.search("Drach", load: true).first.title == "Drach"
    assert Book.search("Drach", load: true).first.title == "Drach"
    assert Book.search("Drach", load: true).first == nil
  end

end
