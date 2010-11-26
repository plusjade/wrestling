require 'test_helper'

class WrestlersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wrestlers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wrestler" do
    assert_difference('Wrestler.count') do
      post :create, :wrestler => { }
    end

    assert_redirected_to wrestler_path(assigns(:wrestler))
  end

  test "should show wrestler" do
    get :show, :id => wrestlers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => wrestlers(:one).to_param
    assert_response :success
  end

  test "should update wrestler" do
    put :update, :id => wrestlers(:one).to_param, :wrestler => { }
    assert_redirected_to wrestler_path(assigns(:wrestler))
  end

  test "should destroy wrestler" do
    assert_difference('Wrestler.count', -1) do
      delete :destroy, :id => wrestlers(:one).to_param
    end

    assert_redirected_to wrestlers_path
  end
end
