require 'test_helper'

class FilmControllerTest < ActionController::TestCase
  test "should get getFilm" do
    get :getFilm
    assert_response :success
  end

end
