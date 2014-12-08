require 'test_helper'

class GamesControllerTest < ActionController::TestCase

  test "should get show" do
  	u = FactoryGirl.create(:player)
    sign_in u

  	game = FactoryGirl.create(:game)  	  	
  	puts game.inspect
  	puts u.inspect
  	
    get :show, :id => game.id
    assert_response :success
  end

end
