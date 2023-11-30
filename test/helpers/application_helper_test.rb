require "test_helper"

class ApplicationHelperTest < ActionView::TestCase

  test "isWeekend?" do
    date1 = Date.new(2023,11,20)
    date2 = Date.new(2023,11,18)
    assert_equal(false, isWeekend?(date1)) && assert_equal(true, isWeekend?(date2))
  end

  test "dateFirstDayOfTheCurrentYear" do
    assert_equal(dateFirstDayOfTheCurrentWeek, Date.today.beginning_of_week)
  end

  test "firstDayOfCalendar" do
    cal = Date.new(2023,1,2)
    assert_equal(cal, firstDayOfCalendar(2023))
  end

  test "getDateFormated" do
    cal = Date.new(2023,1,2)
    assert_equal(cal.strftime("%Y-%m-%d"), "2023-01-02")
  end  
end