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

  test "move piece" do
    game = FactoryGirl.create(:game)
    piece_to_move = FactoryGirl.create(:pawn, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white")

    post :move, :id => game.id, :piece_id => piece_to_move.id, :x_coord => 3, :y_coord => 5
    
    assert_redirected_to game_path(game)
    piece_to_move.reload
    assert_equal 3, piece_to_move.x_coord
    assert_equal 5, piece_to_move.y_coord
  end

  test "move piece fails" do
    game = FactoryGirl.create(:game)
    piece_to_move = FactoryGirl.create(:pawn, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white")
    piece_to_capture = FactoryGirl.create(:pawn, :game_id => game.id, :x_coord => 3, :y_coord => 5, :color => "white")

    post :move, :id => game.id, :piece_id => piece_to_move.id, :x_coord => 3, :y_coord => 5
    piece_to_capture.reload
    assert_not_nil piece_to_capture.x_coord
    assert_not_nil piece_to_capture.y_coord
    piece_to_move.reload
    assert_equal 3, piece_to_move.x_coord
    assert_equal 4, piece_to_move.y_coord
    assert_redirected_to game_path(game)
    assert flash[:notice].present?
  end

end
