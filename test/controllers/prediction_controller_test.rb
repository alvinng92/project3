require 'test_helper'

class PredictionControllerTest < ActionController::TestCase
  test "should get is_valid_postcode?" do
    get :is_valid_postcode?
    assert_response :success
  end

  test "should get get_prediction" do
    get :get_prediction
    assert_response :success
  end

end
