require "test_helper"

class DataModelsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get data_models_create_url
    assert_response :success
  end

  test "should get update" do
    get data_models_update_url
    assert_response :success
  end
end
