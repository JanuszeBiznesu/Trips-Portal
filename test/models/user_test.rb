require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example",surname: "User", pesel: "93032213997", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
    User.tire.index.delete
    User.import
    User.tire.index.refresh
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "User can be searched with correct data" do
    assert User.search("Michael", load: true).first.surname == "Example"
    assert User.search("Lana", load: true).first.surname == "Kane"
  end

end