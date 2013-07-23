require 'test_helper'

class TattoosControllerTest < ActionController::TestCase
  setup do
    @tattoo = tattoos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tattoos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tattoo" do
    assert_difference('Tattoo.count') do
      post :create, tattoo: {  }
    end

    assert_redirected_to tattoo_path(assigns(:tattoo))
  end

  test "should show tattoo" do
    get :show, id: @tattoo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tattoo
    assert_response :success
  end

  test "should update tattoo" do
    put :update, id: @tattoo, tattoo: {  }
    assert_redirected_to tattoo_path(assigns(:tattoo))
  end

  test "should destroy tattoo" do
    assert_difference('Tattoo.count', -1) do
      delete :destroy, id: @tattoo
    end

    assert_redirected_to tattoos_path
  end
end
