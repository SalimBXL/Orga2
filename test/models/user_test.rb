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

  test "Can get users actives only" do 
    inactives = User.where(inactive: true).count
    actives = User.all.count - inactives
    assert_equal actives, User.actives.count, "Cant find the active users"
  end

  test "Should find managers" do
    managers = User.where(manager: true).count
    assert_equal User.managers.count, managers, "Cant find teh managers" 
  end

  test "Should find resources where user is a referent" do
    res = @user.resources 
    assert_equal res.count, 2, "Cant find resources "
  end

  test "Should say is user is manager" do
    assert @user.isManager?, "Cant say if user is manager"
    refute @another.isManager?, "Cant say if user is manager" 
  end

  test "Should say is user is administrator" do
    assert @user.isAdministrator?, "Cant say if user is administrator"
    refute @another.isAdministrator?, "Cant say if user is administrator" 
  end

  test "Should say is user is Active" do
    assert @user.isActive?, "Cant say if user is active"
    refute users(:one_inactive).isActive?, "Cant say if user is active" 
  end

  test "Should say is user is InActive" do
    refute @user.isInactive?, "Cant say if user is inactive"
    assert users(:one_inactive).isInactive?, "Cant say if user is inactive" 
  end

  test "Should get fullname" do
    assert_equal @user.fullname, "P. Nom De Famille", "Cant get the fullname"
  end

  test "Should get complete fullname" do
    assert_equal @user.completeFullname, "Prenom Nom De Famille", "Cant get the complete fiullname"
  end
end
