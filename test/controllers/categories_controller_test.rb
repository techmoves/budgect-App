require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get categories_new_url
    assert_response :success
  end
end
