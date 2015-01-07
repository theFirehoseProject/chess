class Queen < Piece

	def is_move_allowed?(new_x, new_y)
		# check whether suggested move obeys game logic
		move_logic_is_valid = false		
		if legit_moves.include? [new_x, new_y]
			move_logic_is_valid = true
		end		

		# if the destination location obeys the game rules, then check for obstructions
		if move_logic_is_valid
			# if is_move_obstructed returns true, then return 'false' for main function,
			# and vice versa
			return !self.game.is_move_obstructed?(self.id, new_x, new_y)
		else 
			return nil
		end
	end

	def legit_moves
		# return an array of squares that the piece can move to
	end

	def self.get_image(color)
		if color == "white"
			return "white-queen.gif"
		elsif color == "black"
			return "black-queen.gif"
		end
	end

end