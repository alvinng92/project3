require 'test_helper'

class ObservationsControllerTest < ActionController::TestCase
  setup do
    @observation = observations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:observations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create observation" do
    assert_difference('Observation.count') do
      post :create, observation: { dewpoint: @observation.dewpoint, location_id: @observation.location_id, rain_since_9am: @observation.rain_since_9am, temp: @observation.temp, wind_dir: @observation.wind_dir, wind_spd_kph: @observation.wind_spd_kph }
    end

    assert_redirected_to observation_path(assigns(:observation))
  end

  test "should show observation" do
    get :show, id: @observation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @observation
    assert_response :success
  end

  test "should update observation" do
    patch :update, id: @observation, observation: { dewpoint: @observation.dewpoint, location_id: @observation.location_id, rain_since_9am: @observation.rain_since_9am, temp: @observation.temp, wind_dir: @observation.wind_dir, wind_spd_kph: @observation.wind_spd_kph }
    assert_redirected_to observation_path(assigns(:observation))
  end

  test "should destroy observation" do
    assert_difference('Observation.count', -1) do
      delete :destroy, id: @observation
    end

    assert_redirected_to observations_path
  end
end
