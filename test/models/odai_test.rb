require 'test_helper'

class OdaiTest < ActiveSupport::TestCase
  def setup
    @odai = odais(:odai_one)
  end

  test "should be valid" do
    assert @odai.valid?
  end 

  test "odai detail should be present" do
    @odai.detail = ""
    assert_not @odai.valid?
  end

  test "odai user_id should be present" do
    assert @odai.user_id
  end

  test "odai detail should not be too long" do 
    @odai.detail = "a" * 141
    assert_not @odai.valid?
  end 

end
