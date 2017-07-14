require 'test_helper'

class MoriCinemaTodaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mori_cinema_today = mori_cinema_todays(:one)
  end

  test "should get index" do
    get mori_cinema_todays_url
    assert_response :success
  end

  test "should get new" do
    get new_mori_cinema_today_url
    assert_response :success
  end

  test "should create mori_cinema_today" do
    assert_difference('MoriCinemaToday.count') do
      post mori_cinema_todays_url, params: { mori_cinema_today: { three_d: @mori_cinema_today.three_d, title: @mori_cinema_today.title, two_d: @mori_cinema_today.two_d } }
    end

    assert_redirected_to mori_cinema_today_url(MoriCinemaToday.last)
  end

  test "should show mori_cinema_today" do
    get mori_cinema_today_url(@mori_cinema_today)
    assert_response :success
  end

  test "should get edit" do
    get edit_mori_cinema_today_url(@mori_cinema_today)
    assert_response :success
  end

  test "should update mori_cinema_today" do
    patch mori_cinema_today_url(@mori_cinema_today), params: { mori_cinema_today: { three_d: @mori_cinema_today.three_d, title: @mori_cinema_today.title, two_d: @mori_cinema_today.two_d } }
    assert_redirected_to mori_cinema_today_url(@mori_cinema_today)
  end

  test "should destroy mori_cinema_today" do
    assert_difference('MoriCinemaToday.count', -1) do
      delete mori_cinema_today_url(@mori_cinema_today)
    end

    assert_redirected_to mori_cinema_todays_url
  end
end
