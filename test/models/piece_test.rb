require 'test_helper'

class PieceTest < ActiveSupport::TestCase

	test "move piece" do
		game = FactoryGirl.create(:game)
		piece_to_move = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white", :piece_type => "pawn")

		actual = piece_to_move.move_piece!(3, 5)
		assert actual
		piece_to_move.reload
		assert_equal 3, piece_to_move.x_coord, "Moved piece x_coord is changed to 3"
		assert_equal 5, piece_to_move.y_coord, "Moved piece y_coord is changed to 5"
	end


	test "capture piece" do
		game = FactoryGirl.create(:game)
		piece_to_move = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white", :piece_type => "pawn")
		piece_to_capture = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 3, :y_coord => 5, :color => "black", :piece_type => "pawn")

		actual = piece_to_move.move_piece!(3, 5)
		assert actual
		piece_to_capture.reload
		assert_nil piece_to_capture.x_coord, "Captured piece x_coord is changed to nil"
		assert_nil piece_to_capture.y_coord, "Captured piece y_coord is changed to nil"
		piece_to_move.reload
		assert_equal 3, piece_to_move.x_coord, "Moved piece x_coord is changed to 3"
		assert_equal 5, piece_to_move.y_coord, "Moved piece y_coord is changed to 5"
	end

	test "move piece fails" do
		game = FactoryGirl.create(:game)
		piece_to_move = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white", :piece_type => "pawn")
		piece_to_capture = FactoryGirl.create(:piece, :game_id => game.id, :x_coord => 3, :y_coord => 5, :color => "white", :piece_type => "pawn")

		actual = piece_to_move.move_piece!(3, 5)
		assert !actual
		piece_to_capture.reload
		assert_not_nil piece_to_capture.x_coord, "Captured piece x_coord is changed to nil"
		assert_not_nil piece_to_capture.y_coord, "Captured piece y_coord is changed to nil"
		piece_to_move.reload
		assert_equal 3, piece_to_move.x_coord, "Moved piece x_coord is changed to 3"
		assert_equal 4, piece_to_move.y_coord, "Moved piece y_coord is changed to 5"
	end

	test "check pawn moves are legit" do 		
		piece = FactoryGirl.create(:piece, :x_coord => 3, :y_coord => 4, :color => "white", :piece_type => "pawn")
		actual = piece.is_move_allowed?(3, 5)
		assert actual, "White pawns move up the board 1 or 2 places"

		actual = piece.is_move_allowed?(3, 7)
		assert_not actual, "White pawns don't move more than 2 places up"

		actual = piece.is_move_allowed?(3, 2)
		assert_not actual, "White pawns don't move backwards (down the board)"

		actual = piece.is_move_allowed?(4, 5)
		assert_not actual, "White pawns don't move sideways"

		piece = FactoryGirl.create(:piece, :x_coord => 3, :y_coord => 4, :color => "black", :piece_type => "pawn")
		actual = piece.is_move_allowed?(3, 3)
		assert actual, "Black pawns move down the board 1 or 2 places"

		actual = piece.is_move_allowed?(3, 0)
		assert_not actual, "Black pawns don't move more than 2 places up"

		actual = piece.is_move_allowed?(3, 6)
		assert_not actual, "Black pawns don't move backwards (up the board)"

		actual = piece.is_move_allowed?(4, 3)
		assert_not actual, "Black pawns don't move sideways"

		# add tests to ensure pieces don't move off the board

	end

end
