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
			return nil
		end
	end

	def legit_moves
		# return an array of squares that the piece can move to
		piece = Piece.find(self.id)
		x_init = piece.x_coord
		y_init = piece.y_coord
		tiles = [1, 2, 3, 4, 5, 6, 7]
		moves = []
		# legit moves:
		# rook can only move sideways or up and down
		# Sideways to the right: add 1-7 to x_init until x_move == 7, y_init remains the same
		tiles.each do |x|
			x_move = x_init + x
			if x_move > 7
				x_move = nil
			end
			moves.push([x_move, y_init])
		end
		# Sideways to the left: subtract 1-7 to x_init until x_move == 0, y_init remains the same
		tiles.each do |x|
			x_move = x_init - x
			if x_move < 0
				x_move = nil
			end  
			moves.push([x_move, y_init])
		end
		# Up move: x_init remains the same, add 1-7 to y_init until y_move == 7, 
		tiles.each do |x|
			y_move = y_init + x
			if y_move > 7
				y_move = nil
			end
			moves.push([x_init, y_move])
		end
		# Down move: x_init remains the same, subtract 1-7 from y_init until y_move == 0
		tiles.each do |x|
			y_move = y_init - x
			if y_move < 0
				y_move = nil
			end
			moves.push([x_init, y_move])
		end

		moves.delete_if {|moves| moves.include?(nil)}

		return moves

	end

end

