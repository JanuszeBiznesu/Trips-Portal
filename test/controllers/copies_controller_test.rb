require 'test_helper'

class CopiesControllerTest < ActionController::TestCase

  def setup
  	@user = users(:michael)
  	@copy = copies(:one)
  end 

  test "create should require logged-in user" do
    assert_no_difference 'Possession.count' do
      post :create
    end
    assert_redirected_to books_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Possession.count' do
      delete :destroy, id: possessions(:one)
    end
    assert_redirected_to books_url
  end

  test "edit should require logged-in user" do
    assert_no_difference 'Possession.count' do
      post :edit, id: 1
    end
    assert_redirected_to books_url
  end

  test "shouldn't get new when not logged in" do
    get :new, id: 1
    assert_redirected_to books_path
  end

  test "should get update when admin" do
   	log_in_as(@user)
    get :update, :id => @copy.id,  :copy => { edition: 2 }
    assert_redirected_to books_path+"/1"
  end

end
