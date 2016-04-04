ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

# Capybara.register_driver :poltergeist do |app|
#   Capybara::Poltergeist::Driver.new(app, {js_errors: false})
# end

## Allow JS tests to use same ActiveRecord connection as our seeds do


class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
