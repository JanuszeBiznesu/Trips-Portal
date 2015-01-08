require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  def setup
  	@user = users(:michael)
  	@not_admin_user = users(:archer)
  	@book = books(:Drach)
  end

  test "shouldn't get new when not logged in" do
    get :new
    assert_redirected_to books_path
  end

  test "shouldn't get edit when not logged in" do
    get :edit, id: 1
    assert_redirected_to books_path+"/1"
  end

  test "shouldn't get update when not logged in" do
    get :update, id: 1
    assert_redirected_to books_path+"/1"
  end

  test "should get new when admin" do
  	log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should get edit when admin" do
   	log_in_as(@user)
    get :edit, id: 1
    assert_response :success
  end

  test "should get update when admin" do
   	log_in_as(@user)
    get :update, :id => @book.id,  :book => { title: "Yeah" }
    assert_redirected_to books_path+"/1"
  end

  test "should get new when not admin" do
  	log_in_as(@not_admin_user)
    get :new
    assert_redirected_to books_path
  end

  test "should get edit when not admin" do
   	log_in_as(@not_admin_user)
    get :edit, id: 1
    assert_redirected_to books_path+"/1"
  end

  test "should get update when not admin" do
   	log_in_as(@not_admin_user)
    get :update, id: 1
    assert_redirected_to books_path+"/1"
  end


end
