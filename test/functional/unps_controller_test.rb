require 'test_helper'

class UnpsControllerTest < ActionController::TestCase
  setup do
    @unp = unps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unp" do
    assert_difference('Unp.count') do
      post :create, unp: { total_amount: @unp.total_amount, unp: @unp.unp }
    end

    assert_redirected_to unp_path(assigns(:unp))
  end

  test "should show unp" do
    get :show, id: @unp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unp
    assert_response :success
  end

  test "should update unp" do
    put :update, id: @unp, unp: { total_amount: @unp.total_amount, unp: @unp.unp }
    assert_redirected_to unp_path(assigns(:unp))
  end

  test "should destroy unp" do
    assert_difference('Unp.count', -1) do
      delete :destroy, id: @unp
    end

    assert_redirected_to unps_path
  end
end
