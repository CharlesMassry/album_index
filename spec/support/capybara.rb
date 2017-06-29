require 'capybara/rspec'

RSpec.configure do
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  Capybara.javascript_driver = :chrome

  Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 5
  end
end


