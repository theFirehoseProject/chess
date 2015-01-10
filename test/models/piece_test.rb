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

	test "check queen moves are legit" do
		piece = FactoryGirl.create(:queen, :x_coord => 2, :y_coord => 2, :color => "white")

		actual = piece.is_move_allowed?(4, 2)
		assert actual, "Queen moves horizontally to the right"

		actual = piece.is_move_allowed?(2, 4)
		assert actual, "Queen moves up the board"

		actual = piece.is_move_allowed?(3, 3)
		assert actual, "Queen moves diagonally up and to the right"

		actual = piece.is_move_allowed?(2, 8)
		assert_not actual, "Queen can not move up off the board"

		actual = piece.is_move_allowed?(-1, 2)
		assert_not actual, "Queen can not move horizontally off the board to the left"

		piece_obstruction = FactoryGirl.create(:pawn, :x_coord => 2, :y_coord => 3, :color => "white", :game => piece.game)
		piece.reload
		actual = piece.is_move_allowed?(2, 4)
		assert ! actual, "There should be an obstruction preventing the piece to move"

	end

end
