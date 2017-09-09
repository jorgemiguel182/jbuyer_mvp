require 'test_helper'

class Backoffice::Filtrado::FiltradosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
