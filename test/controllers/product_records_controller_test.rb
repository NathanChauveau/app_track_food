require "test_helper"

class ProductRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_records_index_url
    assert_response :success
  end

  test "should get create" do
    get product_records_create_url
    assert_response :success
  end

  test "should get destroy" do
    get product_records_destroy_url
    assert_response :success
  end
end
