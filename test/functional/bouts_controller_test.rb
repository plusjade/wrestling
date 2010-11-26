require 'test_helper'

class BoutsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bout" do
    assert_difference('Bout.count') do
      post :create, :bout => { }
    end

    assert_redirected_to bout_path(assigns(:bout))
  end

  test "should show bout" do
    get :show, :id => bouts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bouts(:one).to_param
    assert_response :success
  end

  test "should update bout" do
    put :update, :id => bouts(:one).to_param, :bout => { }
    assert_redirected_to bout_path(assigns(:bout))
  end

  test "should destroy bout" do
    assert_difference('Bout.count', -1) do
      delete :destroy, :id => bouts(:one).to_param
    end

    assert_redirected_to bouts_path
  end
end
