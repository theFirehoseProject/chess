require 'test_helper'

class UserTest < ActiveSupport::TestCase  

  test "user model returns email address for name" do  	
  	user = FactoryGirl.build(:user)
  	expected = "random@chesster.com"
  	assert_equal expected, user.name
  end

end
