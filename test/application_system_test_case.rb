require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  #driven_by :selenium, using: :chrome, screen_size: [1280, 720]
  #driven_by :selenium, using: :headless_chrome, screen_size: [1280, 720]
  driven_by :selenium, using: :headless_firefox, screen_size: [1280, 720]

  Capybara.server = :puma, { silent: true }
end
