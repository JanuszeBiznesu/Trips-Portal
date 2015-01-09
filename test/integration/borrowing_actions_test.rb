require 'test_helper'

class BorrowingActionsTest < ActionDispatch::IntegrationTest

	test "Quick run through the borrowing procedure" do 
		@simple_user = users(:lana)
		@admin_user = users(:michael)
		@book = books(:Drach)
		@copy = copies(:two)
		get book_path(@book)
		assert_select 'input[value="Order"]', count: 0

		log_in_as(@simple_user)
		get book_path(@book)
		assert_select 'input[value="Order"]'

		@simple_user.place_order(@copy)
		assert :success
		get book_path(@book)
		assert_select 'input[value="Unorder"]'


		assert @simple_user.borrow?(@copy)
		log_in_as(@admin_user)
		get book_path(@book)
		assert_select 'input[value="Borrow"]'
		@possession = Possession.where(borrowed_id: @copy.id).first
		get edit_possession_path(@possession)
		@possession.specifier = "active"

		log_in_as(@simple_user)
		get book_path(@book)
		assert_select 'input[value="Unorder"]', count: 0

		log_in_as(@admin_user)
		@admin_user.place_order(@copy)		
		get book_path(@book)
		assert_select 'input[value="Unorder"]'
		assert_select 'input[value="Return"]'

		get edit_possession_path(@possession)
		assert_not @simple_user.borrow?(@copy)
		@possession = Possession.where(borrowed_id: @copy.id).first
		get edit_possession_path(@possession)			
		assert @admin_user.borrow?(@copy)	

	end

end
