require 'test_helper'

class CopyTest < ActiveSupport::TestCase
	def setup
		@copy = copies(:One)
	end


  test "should be valid" do
    assert @copy.valid?
  end

  test "copy id should be present" do
    @copy.copy_id = "     "
    assert_not @copy.valid?
  end

  test "book_id should be present" do
    @copy.book_id = "     "
    assert_not @copy.valid?
  end

end
