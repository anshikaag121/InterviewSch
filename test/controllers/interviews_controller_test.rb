require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interviews_index_url
    assert_response :success
  end

end
