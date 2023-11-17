require "test_helper"

class GroupeTest < ActiveSupport::TestCase

  def setup
    @groupe = groupes(:valid)
  end

  test "Should save well" do
    assert @groupe.valid?, "Cannot save the groupe."
  end

  test "Should not save without a name" do
    @groupe.name = nil
    refute @groupe.valid?, "Can save the groupe without a name."
  end

  test "Should not save with an existing name" do
    groupe2 = groupes(:groupe2)
    groupe2.name = @groupe.name
    refute groupe2.valid?, "Can save the groupe with an existing name."
  end
end