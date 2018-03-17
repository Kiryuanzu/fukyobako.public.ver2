require 'test_helper'

class OdaiFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:anzu)
    sign_in(@user)
  end

  test "odai post flow" do
    sign_in(@user)
    get root_path
    assert_difference 'Odai.count', 1 do
      post odais_path, params: {odai: {detail: "お題テスト", user_id: @user.id}}
    end
    assert_template 'odais/create'
    odai = assigns(:odai)
    assert odai.detail
    assert_equal odai.detail, "お題テスト"
    assert odai.user_id
    assert_equal odai.user_id, @user.id
  end

end