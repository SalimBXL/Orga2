require "test_helper"

class ServiceTest < ActiveSupport::TestCase
    def setup
        @location = locations(:valid)
        @service = services(:valid)
    end


    test "Service valid" do
        assert @service.valid?
    end

    test "invalid without a name" do
        @service.name = nil
        refute @service.valid?, "saved service without a name"
    end

    test "Should not save without a location" do
        @service.location = nil
        assert_not @service.valid?, "Can save the service without a location."
    end


    test "Should not save with an existing name" do
        service2 = services(:service2)
        service2.name = @service.name
        assert_not service2.valid?, "Can save the service with an existing name."
    end
end