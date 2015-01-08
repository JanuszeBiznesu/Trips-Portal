require 'test_helper'

class PossessionsControllerTest < ActionController::TestCase

  test "create should require logged-in user" do
    assert_no_difference 'Possession.count' do
      post :create
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Possession.count' do
      delete :destroy, id: possessions(:one)
    end
    assert_redirected_to login_url
  end

  test "edit should require logged-in user" do
    assert_no_difference 'Possession.count' do
      post :edit, id: 1
    end
    assert_redirected_to books_url+"/1"
  end


end
