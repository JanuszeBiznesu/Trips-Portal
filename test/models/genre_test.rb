require 'test_helper'

class GenreTest < ActiveSupport::TestCase

	def setup
		@genre = genres(:one)
	end

	test "should be valid " do
		assert @genre.valid?
	end

	test "should be invalid without name" do
		@genre.name = nil
		assert_not @genre.valid?
	end

end
