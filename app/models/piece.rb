class Piece < ActiveRecord::Base
	belongs_to :game

	# ========================================================
	# below is a template of methods that each Piece model (Pawn, Rook, etc)
	# need to implement

	def is_move_allowed?(new_x, new_y)
		# return a boolean (true if move is valid, else false)
		# most pieces have two steps: 
		# (1) is the target move allowed by the game piece logic? 
		# (2) is there an obstruction in the way? the game model
		#  	  has a function that checks this:
		#  		   is_move_obstructed?(piece_id, new_x, new_y)		
		#raise NotImplementedError .new("You must implement 'is_move_allowed?' method.")
	end

	def legit_moves
		# return an array of squares that the piece can move to
		#raise NotImplementedError .new("You must implement 'legit_moves' method.")
	end

	def self.get_image(color)
		# return the image file for the piece
		#raise NotImplementedError .new("You must implement 'get_image' method.")
	end

	# end of template methods
	# ========================================================

end
