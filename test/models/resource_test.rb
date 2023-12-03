require "test_helper"

class ResourceTest < ActiveSupport::TestCase
  def setup
    @resource = resources(:valid)
  end

  test "Resource valid" do
    assert @resource.valid?, "Not a valid Resource."
  end

  test "Invalid without a name" do
    @resource.name = nil
    assert_not @resource.valid?, "Valid without a name."
  end

  test "Invalid with an existing name" do
    resource2 = resources(:resource2)
    resource2.name = @resource.name
    refute resource2.valid?, "Valid with an existing name."
  end

  test "Should find resources for a referent" do
    referent = users(:valid)
    res = Resource.for_referent(referent).count
    assert_equal res, 2, "Didnt find the resources for a referent"
  end

  test "Should find resources for a group" do
    groupe = resource_groupes(:valid)
    res = Resource.for_groupe(groupe).count
    assert_equal res, 2, "Didnt find the resources for a groupe"
  end

end
