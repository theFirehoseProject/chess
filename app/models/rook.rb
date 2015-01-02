class Rook < Piece

	def is_move_allowed?(new_x, new_y)
		# return a boolean (true if move is valid, else false)
		# most pieces have two steps: 
		# (1) is the target move allowed by the game piece logic? 
		# (2) is there an obstruction in the way? the game model
		#  	  has a function that checks this:
		#  		   is_move_obstructed?(piece_id, new_x, new_y)
	end

	def legit_moves
		# return an array of squares that the piece can move to
	end

	def self.get_image(color)
		if color == "white"
			return "white-rook.gif"
		elsif color == "black"
			return "black-rook.gif"
		end
	end

end