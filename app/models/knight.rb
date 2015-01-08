class Knight < Piece

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
		# (1) is the target move allowed by the game piece logic? 
		# (2) is there an obstruction in the way? the game model
		#  	  has a function that checks this:
		#  		   is_move_obstructed?(piece_id, new_x, new_y)
	end

	def legit_moves
		piece = Piece.find(self.id)
		x_init = piece.x_coord
		y_init = piece.y_coord
		moves = []
		op1 = x_init+1
		op2 = x_init-1
		op3 = x_init+2
		op4 = x_init-2
		op5 = y_init+1
		op6 = y_init-1
		op7 = y_init+2
		op8 = y_init-2


		(op1 > 7 || op7 > 7 )? move1 = nil : move1 = [op1, op7]

		(op1 > 7 || op8 < 0 )? move2 = nil : move2 = [op1, op8]

		(op2 < 0 || op7 > 7 )? move3 = nil : move3 = [op2, op7]		

		(op2 < 0 || op8 < 0 )? move4 = nil : move4 = [op2, op8]		

		(op3 > 7 || op5 > 7 )? move5 = nil : move5 = [op3, op5]		

		(op3 > 7 || op6 < 0 )? move6 = nil : move6 = [op3, op6]

		(op4 < 0 || op5 > 7)? move7 = nil : move7 = [op4, op5]
				
		(op4 < 0 || op6 < 0)? move8 = nil : move8 = [op4,  op6]

		moves.push(move1, move2, move3, move4, move5, move6, move7, move8)

		moves.delete_if {|move| move == nil}


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