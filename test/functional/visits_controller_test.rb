require 'test_helper'

class VisitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visit" do
    assert_difference('Visit.count') do
      post :create, :visit => { }
    end

    assert_redirected_to visit_path(assigns(:visit))
  end

  test "should show visit" do
    get :show, :id => visits(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => visits(:one).to_param
    assert_response :success
  end

  test "should update visit" do
    put :update, :id => visits(:one).to_param, :visit => { }
    assert_redirected_to visit_path(assigns(:visit))
  end

  test "should destroy visit" do
    assert_difference('Visit.count', -1) do
      delete :destroy, :id => visits(:one).to_param
    end

    assert_redirected_to visits_path
  end
end
