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
end
