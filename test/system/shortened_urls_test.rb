require "application_system_test_case"

class ShortenedUrlsTest < ApplicationSystemTestCase
  setup do
    @shortened_url = shortened_urls(:one)
  end

  test "visiting the index" do
    visit shortened_urls_url
    assert_selector "h1", text: "Shortened Urls"
  end

  test "creating a Shortened url" do
    visit shortened_urls_url
    click_on "New Shortened Url"

    fill_in "Short form", with: @shortened_url.short_form
    fill_in "Target", with: @shortened_url.target
    fill_in "User", with: @shortened_url.user
    fill_in "Visit count", with: @shortened_url.visit_count
    click_on "Create Shortened url"

    assert_text "Shortened url was successfully created"
    click_on "Back"
  end

  test "updating a Shortened url" do
    visit shortened_urls_url
    click_on "Edit", match: :first

    fill_in "Short form", with: @shortened_url.short_form
    fill_in "Target", with: @shortened_url.target
    fill_in "User", with: @shortened_url.user
    fill_in "Visit count", with: @shortened_url.visit_count
    click_on "Update Shortened url"

    assert_text "Shortened url was successfully updated"
    click_on "Back"
  end

  test "destroying a Shortened url" do
    visit shortened_urls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shortened url was successfully destroyed"
  end
end
