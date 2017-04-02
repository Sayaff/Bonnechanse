require 'test_helper'

class StrandsControllerTest < ActionController::TestCase
  setup do
    @strand = strands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:strands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create strand" do
    assert_difference('Strand.count') do
      post :create, strand: { color: @strand.color, description: @strand.description, length: @strand.length, price: @strand.price, title: @strand.title }
    end

    assert_redirected_to strand_path(assigns(:strand))
  end

  test "should show strand" do
    get :show, id: @strand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @strand
    assert_response :success
  end

  test "should update strand" do
    patch :update, id: @strand, strand: { color: @strand.color, description: @strand.description, length: @strand.length, price: @strand.price, title: @strand.title }
    assert_redirected_to strand_path(assigns(:strand))
  end

  test "should destroy strand" do
    assert_difference('Strand.count', -1) do
      delete :destroy, id: @strand
    end

    assert_redirected_to strands_path
  end
end
