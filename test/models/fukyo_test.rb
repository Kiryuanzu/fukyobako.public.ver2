require 'test_helper'

class FukyoTest < ActiveSupport::TestCase
  def setup
    @fukyo = fukyos(:fukyo_one)
    @odai = odais(:odai_one)
  end

  test "should be valid?" do 
    assert @fukyo.valid?
  end

  test "fukyo title should be present" do
    @fukyo.title = ""
    assert_not @fukyo.valid?
  end 

  test "fukyo odai_id be equal" do
    assert @fukyo.odai_id
    assert_equal @fukyo.odai_id, @odai.id
  end 
 
end
