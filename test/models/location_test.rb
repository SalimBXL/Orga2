require "test_helper"

class LocationTest < ActiveSupport::TestCase

  def setup
    @location = locations(:valid)
  end

  test "location valid" do
    assert @location.valid?, "Not a valid location."
  end

  test "Invalid without a name" do
    @location.name = nil
    assert_not @location.valid?, "Valid without a name."
  end

  test "Invalid with an existing name" do
    location2 = locations(:location2)
    location2.name = @location.name
    refute location2.valid?, "Valid with an exisdting name."
  end
end