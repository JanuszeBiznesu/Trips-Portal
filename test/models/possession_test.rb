require 'test_helper'

class PossessionTest < ActiveSupport::TestCase

	def setup
		@possession = possessions(:one)
	end

	test "should be valid " do
		assert @possession.valid?
	end

	test "should be invalid without borrower id" do
		@possession.borrower_id = nil
		assert_not @possession.valid?
	end

	test "should be invalid without borrowed id" do
		@possession.borrowed_id = nil
		assert_not @possession.valid?
	end

end
