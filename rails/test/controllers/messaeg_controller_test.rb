require 'test_helper'

class MessaegControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get messaeg_create_url
    assert_response :success
  end

end
