require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @user = users(:michael)
  end
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "The Trips Portal"
  end


  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | The Trips Portal"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | The Trips Portal"
  end
  
end
