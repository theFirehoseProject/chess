class Piece < ActiveRecord::Base
	belongs_to :game


	def is_move_allowed?(new_x, new_y)
		# need to check the following:
		#   - is move permitted for that piece according to piece rules?
		# 	- is the move obstructed by another piece?
		piece = Piece.find(self.id)
		if piece.piece_type == 'pawn'
			return legit_moves_for_pawn.include? [new_x, new_y]
		end
	end

	def legit_moves_for_pawn
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

end
