require 'test_helper'

class GamesControllerTest < ActionController::TestCase

  # called before any test is run
  def setup
    @u = FactoryGirl.create(:player)
    sign_in @u
  end

  # called after any test is run
  def teardown
    sign_out @u
  end

  test "should get show" do
  	game = FactoryGirl.create(:game)
    get :show, :id => game.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    o = FactoryGirl.create(:opponent)    
    post :create, game: {:opponent_id => o.id}
    new_game = Game.last
    assert_redirected_to game_path(new_game.id)
  end


end
