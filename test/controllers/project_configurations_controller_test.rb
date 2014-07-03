require 'test_helper'

class ProjectConfigurationsControllerTest < ActionController::TestCase
  setup do
    @project_configuration = project_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_configuration" do
    assert_difference('ProjectConfiguration.count') do
      post :create, project_configuration: { destination: @project_configuration.destination, enabled: @project_configuration.enabled, name: @project_configuration.name, source: @project_configuration.source }
    end

    assert_redirected_to project_configuration_path(assigns(:project_configuration))
  end

  test "should show project_configuration" do
    get :show, id: @project_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_configuration
    assert_response :success
  end

  test "should update project_configuration" do
    patch :update, id: @project_configuration, project_configuration: { destination: @project_configuration.destination, enabled: @project_configuration.enabled, name: @project_configuration.name, source: @project_configuration.source }
    assert_redirected_to project_configuration_path(assigns(:project_configuration))
  end

  test "should destroy project_configuration" do
    assert_difference('ProjectConfiguration.count', -1) do
      delete :destroy, id: @project_configuration
    end

    assert_redirected_to project_configurations_path
  end
end
