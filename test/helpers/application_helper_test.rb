require "test_helper"

class ApplicationHelperTest < ActionView::TestCase

  test "isWeekend?" do
    date1 = Date.new(2023,11,20)
    date2 = Date.new(2023,11,18)


    assert_equal(false, isWeekend?(date1)) && assert_equal(true, isWeekend?(date2))
  end
end