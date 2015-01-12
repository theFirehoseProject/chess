require 'test_helper'

class PieceTest < ActiveSupport::TestCase

	test "move piece" do
		game = FactoryGirl.create(:game)
		piece_to_move = FactoryGirl.create(:pawn, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white")

		actual = piece_to_move.move_piece!(3, 5)
		assert actual
		piece_to_move.reload
		assert_equal 3, piece_to_move.x_coord
		assert_equal 5, piece_to_move.y_coord
	end


	test "capture piece" do
		game = FactoryGirl.create(:game)
		piece_to_move = FactoryGirl.create(:pawn, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white")
		piece_to_capture = FactoryGirl.create(:pawn, :game_id => game.id, :x_coord => 3, :y_coord => 5, :color => "black")

		actual = piece_to_move.move_piece!(3, 5)
		assert actual
		piece_to_capture.reload
		assert_nil piece_to_capture.x_coord
		assert_nil piece_to_capture.y_coord
		piece_to_move.reload
		assert_equal 3, piece_to_move.x_coord
		assert_equal 5, piece_to_move.y_coord
	end

	test "move piece fails" do
		game = FactoryGirl.create(:game)
		piece_to_move = FactoryGirl.create(:pawn, :game_id => game.id, :x_coord => 3, :y_coord => 4, :color => "white")
		piece_to_capture = FactoryGirl.create(:pawn, :game_id => game.id, :x_coord => 3, :y_coord => 5, :color => "white")

		actual = piece_to_move.move_piece!(3, 5)
		assert !actual
		piece_to_capture.reload
		assert_not_nil piece_to_capture.x_coord
		assert_not_nil piece_to_capture.y_coord
		piece_to_move.reload
		assert_equal 3, piece_to_move.x_coord
		assert_equal 4, piece_to_move.y_coord
	end

	test "check pawn moves are legit" do 		
		piece = FactoryGirl.create(:pawn, :x_coord => 3, :y_coord => 4, :color => "white")
		actual = piece.is_move_allowed?(3, 5)
		assert actual, "White pawns move up the board 1 or 2 places"

		actual = piece.is_move_allowed?(3, 7)
		assert_not actual, "White pawns don't move more than 2 places up"

		actual = piece.is_move_allowed?(3, 2)
		assert_not actual, "White pawns don't move backwards (down the board)"

		actual = piece.is_move_allowed?(4, 5)
		assert_not actual, "White pawns don't move sideways"

		piece = FactoryGirl.create(:pawn, :x_coord => 3, :y_coord => 4, :color => "black")
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

	test "check king moves are legit" do
		# Kings can move up, down, left, right, and diagonal up or down 1 place only. 
		piece = FactoryGirl.create(:king, :x_coord => 4, :y_coord => 0, :color => "white")

		actual = piece.is_move_allowed?(4, 1)
		assert actual, "King moves up the board 1 place."

		actual = piece.is_move_allowed?(5, 0)
		assert actual, "King moves horizontally to his right 1 place."

		actual = piece.is_move_allowed?(5, 1)
		assert actual, "King moves diagonally up to his right 1 place."

		actual = piece.is_move_allowed?(3, 0)
		assert actual, "King moves horizontally to his left 1 place."

		actual = piece.is_move_allowed?(3, 1)
		assert actual, "King moves diagonally up to his left 1 place."

		actual = piece.is_move_allowed?(4, 2)
		assert_not actual, "King cannot move up the board more than 1 place."

		actual = piece.is_move_allowed?(-1, 0)
		assert_not actual, "King cannot move horizontally to the left off the board."

		actual = piece.is_move_allowed?(6, 0)
		assert_not actual, "King cannot move horizontally more than 1 place to the right."

		actual = piece.is_move_allowed?(6, 2)
		assert_not actual, "King cannot move diagonally right up the board more than 1 place."

		actual = piece.is_move_allowed?(4, -1)
		assert_not actual, "King cannot move down off the board."

		actual = piece.is_move_allowed?(8, 8)
		assert_not actual, "King cannot move diagonally off the board more than one place."
	end

end
