require 'test_helper'

class RelatoriosControllerTest < ActionController::TestCase
  test "should get form" do
    get :form
    assert_response :success
  end

  test "should get gerar" do
    get :gerar
    assert_response :success
  end

end
