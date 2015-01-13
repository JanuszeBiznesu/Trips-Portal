require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @user = users(:michael)
  end
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "The Digital Library"
  end


  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | The Digital Library"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | The Digital Library"
  end
  
end
