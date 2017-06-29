def resize_window(size)
  Capybara.current_session.driver.browser.manage.window.resize_to(size[:width], size[:height])
end