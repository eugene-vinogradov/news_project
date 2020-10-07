# frozen_string_literal: true

require 'test_helper'

class BasePagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get base_pages_home_url
    assert_response :success
  end

  test 'should get about' do
    get base_pages_about_url
    assert_response :success
  end

  test 'should get contacts' do
    get base_pages_contacts_url
    assert_response :success
  end

  test 'should get help' do
    get base_pages_help_url
    assert_response :success
  end
end
