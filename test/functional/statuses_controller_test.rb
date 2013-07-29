require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:farid)
    get :new
    assert_response :success
  end

  test "should be logged in to post a status" do
    post :create, status: { content: "Hello" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status when logged in" do
    sign_in users(:farid)

    assert_difference('Status.count') do
    post :create, status: { content: @status.content }
  end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should create status for the current user when logged in" do
    sign_in users(:farid)

    assert_difference('Status.count') do
    post :create, status: { content: @status.content, user_id: users(:batman).id }
  end

    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:farid).id
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get edit status when logged in" do
    sign_in users(:farid)
    get :edit, id: @status
    assert_response :success
  end


  test "should redirect status update when not logged in" do
    put :update, id: @status, status: { content: @status.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end 

  test "should update status when logged in" do
    sign_in users(:farid)
    put :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should update status for the current user when logged in" do
    sign_in users(:farid)
    put :update, id: @status, status: { content: @status.content, user_id: users(:batman).id }
    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:farid).id
  end

  test "should not update the status if nothing has changed" do
    sign_in users(:farid)
    put :update, id: @status
    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:farid).id
  end

  test "should not "

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end