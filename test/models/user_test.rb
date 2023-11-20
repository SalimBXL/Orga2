require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:valid)
    @another = users(:another)
  end

  test "Valid user" do
    assert @user.valid?, "Invalid user."
  end

  test "Invalid user without email" do
    @user.email = nil
    refute @user.valid?, "Valid user without email."
  end

  test "Email must be unique" do
    @another.email = @user.email
    refute @another.valid?, "Valid user with existing email"
  end

end
