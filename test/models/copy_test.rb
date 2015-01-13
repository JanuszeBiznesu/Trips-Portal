require 'test_helper'

class CopyTest < ActiveSupport::TestCase

	def setup
		@copy10 = copies(:One)
    @copy13 = copies(:One)
	end

  test "should be valid" do
    assert @copy10.valid?
    assert @copy13.valid?
  end

  test "book_id should be present" do
    @copy10.book_id = "     "
    assert_not @copy10.valid?
  end

  test "edition should be present" do
    @copy10.edition = "     "
    assert_not @copy10.valid?
  end

  test "isbn should be present" do
    @copy10.ISBN = "     "
    assert_not @copy10.valid?
  end

  test "edition should be correct" do
    @copy10.edition = "     "
    assert_not @copy10.valid?
  end

  test "year of print should be correct" do
    @copy10.year_of_print = Time.zone.now.year + 10
    assert_not @copy10.valid?
  end

  test "isbn should be correct" do
    @copy10.ISBN = "ojejku, nie znam tego formatu"
    assert_not @copy10.valid?
  end


end
