require 'test_helper'

class AcceptTest < ActionDispatch::IntegrationTest

  def setup
    @user1 = users(:michael)
    @user2 = users(:lana)
    @trip = trips(:one)
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@user2)
    assert_difference "Trip.count", 1 do 
    	post trips_path, trip: {:text => "Arek", :grade => 5, :user_id => 1, :country_id => 1, :title => "TItle"}
    end
    @trip = Trip.first
    patch trip_path(@trip), trip: { :title => "tralala"}
    log_in_as(@user1)
    assert_equal(Trip.search("tralala") != [], true) 
    assert_difference "Comment.count", 1 do 
    	post comments_path, comment: {:trip_id => @trip.id, :user_id => @user1.id, :text => "Tralalala", :grade => "30"}
    end  
    patch comment_path(@trip.comments.first), comment: { :text => "ulalala"} 
    assert_equal(@trip.comments.first.text, "ulalala")
    delete comment_path(@trip.comments.first)
    assert_equal( (@trip.comments.length),  0)
    assert_difference "Comment.count", 1 do 
    	post comments_path, comment: {:trip_id => @trip.id, :user_id => @user1.id, :text => "Tralalala", :grade => "30"}
    end 
    deleted_user_id = @user2.id
    assert_difference "User.count", -1 do 
    	delete user_path(@user2)
    end 
    assert_equal(Trip.where(:user_id => deleted_user_id).length, 0)
  end

end
