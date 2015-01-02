require 'test_helper'

class GameTest < ActiveSupport::TestCase





	test "check obstruction logic"  do
		game = FactoryGirl.create(:game)
		piece_to_move = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white", :piece_type => "pawn")
		different_piece = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 3, :y_coord => 5, :color => "white", :piece_type => "pawn")

		actual = game.is_move_obstructed?(piece_to_move.id,3, 5)
		assert actual, "There should be an obstruction detected on target tile"

		actual = game.is_move_obstructed?(piece_to_move.id,3, 6)
		assert actual, "There should be an obstruction detected in between target and piece tile"
		
		actual = game.is_move_obstructed?(piece_to_move.id,2, 4)
		assert_not actual, "There should be no obstruction detected in between target and piece tile"

		actual = game.is_move_obstructed?(piece_to_move.id,6, 7)
		assert_not actual, "There should be no obstruction detected on diagonal in between target and piece tile"

		actual = game.is_move_obstructed?(piece_to_move.id,6, 6)
		assert_nil actual, "Should return nil if destination tile is not on horiz/vert/diagonal line from piece tile"
	end

	test "check obstruction and move validity logic combined" do
		game = FactoryGirl.create(:game)
		piece_to_move = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white", :piece_type => "pawn")
		different_piece = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 3, :y_coord => 5, :color => "white", :piece_type => "pawn")

		actual = piece_to_move.is_move_allowed?(3,5)
		assert_not actual, "Move is valid but there is an obstruction detected on target tile"

		actual = piece_to_move.is_move_allowed?(2,5)
		assert_not actual, "The move isn't valid"

		piece_to_move = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 2, :y_coord => 4, :color => "white", :piece_type => "pawn")
		actual = piece_to_move.is_move_allowed?(2,5)
		assert actual, "Move is valid and there is no obstruction detected on target tile"
	end
end
