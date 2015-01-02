class Piece < ActiveRecord::Base
	belongs_to :game

	def move_piece!(x_coord, y_coord)   	
		captured = self.game.pieces.where(:x_coord => x_coord, :y_coord => y_coord).first
		if captured.present? && self.color != captured.color
			captured.update_attributes(:x_coord => nil, :y_coord => nil)
			self.update_attributes(:x_coord => x_coord, :y_coord => y_coord)
		elsif captured.present? && self.color == captured.color
      		return false
    	else
      		self.update_attributes({:x_coord => x_coord, :y_coord => y_coord})
    	end
		return true
	end

	def is_move_allowed?(new_x, new_y)
		# check whether suggested move obeys game logic
		move_logic_is_valid = false
		piece = Piece.find(self.id)
		if piece.piece_type == 'pawn'
			if legit_moves_for_pawn.include? [new_x, new_y]
				move_logic_is_valid = true
			end
		end

		# if the destination location obeys the game rules, then check for obstructions
		if move_logic_is_valid
			# if is_move_obstructed returns true, then return 'false' for main function,
			# and vice versa
			return self.game.is_move_obstructed?(self.id, new_x, new_y).!
		else 
			return nil
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
