require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:valid)
    @user.password = "passdword"
    @user.password_confirmation = "password"
  end

  test "Valid user" do
    assert @user.valid?, "Invalid user."
  end

  test "Invalid user without email" do
    @user.email = nil
    refute @user.valid?, "Valid user without email."
  end

  # test "Should not save user without email" do
  #   assert_not user.save, "Save the user without an email"
  # end

  # test "Should not save user without firstname" do
  #   user = User.new(
  #                 email: "john.doe@email.com", 
  #                 firstname: "", 
  #                 lastname: "Doe",
  #                 password: "test",
  #                 password_confirmation: "test")
  #   assert_not user.save, "Save the user without a firstname"
  # end

  # test "Should not save user without lastname" do
  #   user = User.new(
  #                 email: "john.doe@email.com", 
  #                 firstname: "John", 
  #                 lastname: "",
  #                 password: "test",
  #                 password_confirmation: "test")
  #   assert_not user.save, "Save the user without a lastname"
  # end

  # test "Should has saved information correctly" do
  #   user1 = User.new(
  #                 email: "john.doe@email.com", 
  #                 firstname: "John", 
  #                 lastname: "Doe",
  #                 password: "test",
  #                 password_confirmation: "test")
  #   user1.save
  #   user2 = User.find(user1.id)
  #   assert_not_nil user2, "Did not find the user"
  #   assert_equal user1.email, user2.email, "Not saved well"
  #   assert_equal user1.firstname, user2.firstname, "Not saved well"
  #   assert_equal user1.lastname, user2.lastname, "Not saved well"
  # end





end
