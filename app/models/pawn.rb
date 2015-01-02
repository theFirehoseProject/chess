class Pawn < Piece

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
		# currently checks for boundary, and 
		# directionality based on color
		#
		# does NOT currently check the following:
		# - obstructing piece
		# - only move 2 places on first move
		# - move diagonal to take another piece
		piece = Piece.find(self.id)
		x_init = piece.x_coord
		y_init = piece.y_coord
		color  = piece.color

		if color == "black"
			if y_init == 0
				return []
			elsif y_init == 1
				return [ [x_init, y_init - 1] ]
			else
				return [ [x_init, y_init - 1], 
						 [x_init, y_init - 2] ]
			end
		else
			if y_init == 7
				return []
			elsif y_init == 6
				return [ [x_init, y_init + 1] ]
			else
				return [ [x_init, y_init + 1], 
						 [x_init, y_init + 2] ]
			end
		end
	end	

	def self.get_image(color)
		if color == "white"
			return "white-pawn.gif"
		elsif color == "black"
			return "black-pawn.gif"
		end
	end

end