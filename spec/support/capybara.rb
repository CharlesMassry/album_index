require 'capybara/rspec'
RSpec.configure do
  Capybara.javascript_driver = :webkit
  Capybara.default_max_wait_time = 5
end
