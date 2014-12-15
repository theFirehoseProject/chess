require 'test_helper'

class GameTest < ActiveSupport::TestCase

	test "check pawn moves are legit" do 		
		piece = FactoryGirl.create(:piece, :x_coord => 3, :y_coord => 4, :color => "white", :piece_type => "pawn")
		actual = Game.is_move_allowed?(piece.id, 3, 5)
		assert actual, "White pawns move up the board 1 or 2 places"

		actual = Game.is_move_allowed?(piece.id, 3, 7)
		assert_not actual, "White pawns don't move more than 2 places up"

		actual = Game.is_move_allowed?(piece.id, 3, 2)
		assert_not actual, "White pawns don't move backwards (down the board)"

		actual = Game.is_move_allowed?(piece.id, 4, 5)
		assert_not actual, "White pawns don't move sideways"

		piece = FactoryGirl.create(:piece, :x_coord => 3, :y_coord => 4, :color => "black", :piece_type => "pawn")
		actual = Game.is_move_allowed?(piece.id, 3, 3)
		assert actual, "Black pawns move down the board 1 or 2 places"

		actual = Game.is_move_allowed?(piece.id, 3, 0)
		assert_not actual, "Black pawns don't move more than 2 places up"

		actual = Game.is_move_allowed?(piece.id, 3, 6)
		assert_not actual, "Black pawns don't move backwards (up the board)"

		actual = Game.is_move_allowed?(piece.id, 4, 3)
		assert_not actual, "Black pawns don't move sideways"

		# add tests to ensure pieces don't move off the board

	end

end
