require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::TestHelpers
  def setup
    @user = users(:anzu)
    sign_in(@user)
  end
end
