require 'test_helper'

class ShortenedUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shortened_url = shortened_urls(:one)
  end

  test "should get index" do
    get shortened_urls_url
    assert_response :success
  end

  test "should get new" do
    get new_shortened_url_url
    assert_response :success
  end

  test "should create shortened_url" do
    assert_difference('ShortenedUrl.count') do
      post shortened_urls_url, params: { shortened_url: { short_form: @shortened_url.short_form, target: @shortened_url.target, user: @shortened_url.user, visit_count: @shortened_url.visit_count } }
    end

    assert_redirected_to shortened_url_url(ShortenedUrl.last)
  end

  test "should show shortened_url" do
    get shortened_url_url(@shortened_url)
    assert_response :success
  end

  test "should get edit" do
    get edit_shortened_url_url(@shortened_url)
    assert_response :success
  end

  test "should update shortened_url" do
    patch shortened_url_url(@shortened_url), params: { shortened_url: { short_form: @shortened_url.short_form, target: @shortened_url.target, user: @shortened_url.user, visit_count: @shortened_url.visit_count } }
    assert_redirected_to shortened_url_url(@shortened_url)
  end

  test "should destroy shortened_url" do
    assert_difference('ShortenedUrl.count', -1) do
      delete shortened_url_url(@shortened_url)
    end

    assert_redirected_to shortened_urls_url
  end
end
