require "test_helper"

class ResourceGroupeTest < ActiveSupport::TestCase
  def setup
    @groupe = resource_groupes(:valid)
  end

  test "Resource Groupe valid" do
    assert @groupe.valid?, "Not a valid Resource groupe."
  end

  test "Invalid without a name" do
    @groupe.name = nil
    assert_not @groupe.valid?, "Valid without a name."
  end

  test "Invalid with an existing name" do
    groupe2 = resource_groupes(:groupe2)
    groupe2.name = @groupe.name
    refute groupe2.valid?, "Valid with an existing name."
  end
end