require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "creating new resume" do
    visit new_resume_url

    assert_selector "h1", text: "Create new CV"

    name = 'Serene'
    fill_in "resume[name]", with: name
    click_on "Save Resume"

    assert_text name
  end
end