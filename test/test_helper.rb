ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "simplecov"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

SimpleCov.start "rails" do 
  # config
  add_filter %w[
    app/views
    lib/rails
    lib/templates
    bin
    coverage
    log
    test
    vendor
    node_modules
    db
    doc
    public
    storage
    tmp
  ]
  add_group('Carriers', 'app/carriers')
  add_group('Scripts', 'app/scripts')
  add_group("Views", "app/views")
  enable_coverage(:branch)
  enable_coverage_for_eval
end