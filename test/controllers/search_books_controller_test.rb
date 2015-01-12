require 'test_helper'

class SearchBooksControllerTest < ActionController::TestCase

  test "should get contact" do
    get :search
    assert_response :success
  end
  
end
