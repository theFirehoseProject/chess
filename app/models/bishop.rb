class Bishop < Piece

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
			return false
		end
	end

	def legit_moves
	
		x_init = self.x_coord
		y_init = self.y_coord
		squares = [1,2,3,4,5,6,7]
		moves = []

		squares.each do |n|

		(x_init - n < 0)? x_new1 = nil : x_new1 = x_init - n
		(y_init - n < 0)? y_new1 = nil : y_new1 = y_init - n
		(x_init + n > 7)? x_new2 = nil : x_new2 = x_init + n
		(y_init + n > 7)? y_new3 = nil : y_new3 = y_init + n

		move1 = [x_new1 , y_new1]
		move2 = [x_new2 , y_new1]
		move3 = [x_new2 , y_new3]
		move4 = [x_new1 , y_new3]

		moves.push(move1, move2, move3, move4)
		
		moves.delete_if { |move| move.include?(nil)}

		end
				return moves
	
		# returns an array of squares that the piece can move to
	end

	def self.get_image(color)
		if color == "white"
			return "white-bishop.gif"
		elsif color == "black"
			return "black-bishop.gif"
		end
	end
end