class Rook < Piece

	def is_move_allowed?(new_x, new_y)
		# return a boolean (true if move is valid, else false)
		# is the target move allowed by the game piece logic? 
		move_logic_is_valid = false
		if legit_moves.include?	[new_x, new_y]
			move_logic_is_valid = true
		end
		# is there an obstruction in the way? the game model
		if move_logic_is_valid
		# if is_move_obstructed returns true, then return false for method
			return !self.game.is_move_obstructed?(self.id, new_x, new_y)
		else
			return false
		end
	end

def legit_moves
		# return an array of squares that the piece can move to
		x_init = self.x_coord
		y_init = self.y_coord
		tiles = [1, 2, 3, 4, 5, 6, 7]
		moves = []
		
		tiles.each do |x|
			
			(x_init + x > 7)? x_move1 = nil : x_move1 = x_init + x
			(x_init - x < 0)? x_move2 = nil : x_move2 = x_init - x
			(y_init + x > 7)? y_move1 = nil : y_move1 = y_init + x
			(y_init - x < 0)? y_move2 = nil : y_move2 = y_init - x

			# Sideways to the right
			move1 = [x_move1, y_init]
			# Sideways to the left
			move2 = [x_move2, y_init]
			# Up move
			move3 = [x_init, y_move1]
			# Down move
			move4 = [x_init, y_move2]

			moves.push(move1, move2, move3, move4)

		end

		moves.delete_if {|moves| moves.include?(nil)}

		return moves

end

	def self.get_image(color)
		if color == "white"
			return "white-rook.gif"
		elsif color == "black"
			return "black-rook.gif"
		end
	end

end

