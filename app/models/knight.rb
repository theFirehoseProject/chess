class Knight < Piece

	def is_move_allowed?(new_x, new_y)
		# check whether suggested move obeys game logic
		move_logic_is_valid = false		
		if legit_moves.include? [new_x, new_y]
			move_logic_is_valid = true
		end		
	end

	def legit_moves
		piece = Piece.find(self.id)
		x_init = piece.x_coord
		y_init = piece.y_coord
		moves = []
		x_plus1 = x_init+1
		x_minus1 = x_init-1
		x_plus2 = x_init+2
		x_minus2 = x_init-2
		y_plus1 = y_init+1
		y_minus1 = y_init-1
		y_plus2 = y_init+2
		y_minus2 = y_init-2


		(x_plus1 > 7 || y_plus2 > 7 )? move1 = nil : move1 = [x_plus1, y_plus2]

		(x_plus1 > 7 || y_minus2 < 0 )? move2 = nil : move2 = [x_plus1, y_minus2]

		(x_minus1 < 0 || y_plus2 > 7 )? move3 = nil : move3 = [x_minus1, y_plus2]		

		(x_minus1 < 0 || y_minus2 < 0 )? move4 = nil : move4 = [x_minus1, y_minus2]		

		(x_plus2 > 7 || y_plus1 > 7 )? move5 = nil : move5 = [x_plus2, y_plus1]		

		(x_plus2 > 7 || y_minus1 < 0 )? move6 = nil : move6 = [x_plus2, y_minus1]

		(x_minus2 < 0 || y_plus1 > 7)? move7 = nil : move7 = [x_minus2, y_plus1]
				
		(x_minus2 < 0 || y_minus1 < 0)? move8 = nil : move8 = [x_minus2,  y_minus1]

		moves.push(move1, move2, move3, move4, move5, move6, move7, move8)

		moves.delete_if { |move| move == nil }


				return moves
		# return an array of squares that the piece can move to
	end

	def self.get_image(color)
		if color == "white"
			return "white-knight.gif"
		elsif color == "black"
			return "black-knight.gif"
		end
	end

end