require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  def setup
    Rails.application.load_seed
  end

  test "visiting the index" do
    visit root_url
    assert_selector "h1", text: "find the right trip with the right team."
  end
end
