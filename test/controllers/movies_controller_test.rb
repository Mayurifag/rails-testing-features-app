require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { box_office_ru: @movie.box_office_ru, budget: @movie.budget, composers: @movie.composers, countries: @movie.countries, description: @movie.description, directors: @movie.directors, duration: @movie.duration, genres: @movie.genres, imdb_rating: @movie.imdb_rating, premiere_ru: @movie.premiere_ru, premiere_world: @movie.premiere_world, producers: @movie.producers, rating: @movie.rating, slogan: @movie.slogan, title: @movie.title } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should show movie" do
    get movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { box_office_ru: @movie.box_office_ru, budget: @movie.budget, composers: @movie.composers, countries: @movie.countries, description: @movie.description, directors: @movie.directors, duration: @movie.duration, genres: @movie.genres, imdb_rating: @movie.imdb_rating, premiere_ru: @movie.premiere_ru, premiere_world: @movie.premiere_world, producers: @movie.producers, rating: @movie.rating, slogan: @movie.slogan, title: @movie.title } }
    assert_redirected_to movie_url(@movie)
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie)
    end

    assert_redirected_to movies_url
  end
end
