class Game < ActiveRecord::Base
	has_many :pieces
	belongs_to :user
    belongs_to :opponent, :foreign_key => 'opponent_id', :class_name => User
	scope :for_user, lambda {|user_id| where("user_id = ? OR opponent_id = ?", user_id, user_id)}

	def initialize_the_board!
		self.pieces.create(
			:color => 'white',
			:x_coord => 0,
			:y_coord => 0,
			:piece_type => 'rook',
			:image => 'white-rook.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 1,
			:y_coord => 0,
			:piece_type => 'knight',
			:image => 'white-knight.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 2,
			:y_coord => 0,
			:piece_type => 'bishop',
			:image => 'white-bishop.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 3,
			:y_coord => 0,
			:piece_type => 'queen',
			:image => 'white-queen.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 4,
			:y_coord => 0,
			:piece_type => 'king',
			:image => 'white-king.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 5,
			:y_coord => 0,
			:piece_type => 'bishop',
			:image => 'white-bishop.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 6,
			:y_coord => 0,
			:piece_type => 'knight',
			:image => 'white-knight.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 7,
			:y_coord => 0,
			:piece_type => 'rook',
			:image => 'white-rook.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 0,
			:y_coord => 1,
			:piece_type => 'pawn',
			:image => 'white-pawn.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 1,
			:y_coord => 1,
			:piece_type => 'pawn',
			:image => 'white-pawn.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 2,
			:y_coord => 1,
			:piece_type => 'pawn',
			:image => 'white-pawn.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 3,
			:y_coord => 1,
			:piece_type => 'pawn',
			:image => 'white-pawn.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 4,
			:y_coord => 1,
			:piece_type => 'pawn',
			:image => 'white-pawn.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 5,
			:y_coord => 1,
			:piece_type => 'pawn',
			:image => 'white-pawn.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 6,
			:y_coord => 1,
			:piece_type => 'pawn',
			:image => 'white-pawn.gif'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 7,
			:y_coord => 1,
			:piece_type => 'pawn',
			:image => 'white-pawn.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 0,
			:y_coord => 6,
			:piece_type => 'pawn',
			:image => 'black-pawn.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 1,
			:y_coord => 6,
			:piece_type => 'pawn',
			:image => 'black-pawn.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 2,
			:y_coord => 6,
			:piece_type => 'pawn',
			:image => 'black-pawn.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 3,
			:y_coord => 6,
			:piece_type => 'pawn',
			:image => 'black-pawn.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 4,
			:y_coord => 6,
			:piece_type => 'pawn',
			:image => 'black-pawn.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 5,
			:y_coord => 6,
			:piece_type => 'pawn',
			:image => 'black-pawn.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 6,
			:y_coord => 6,
			:piece_type => 'pawn',
			:image => 'black-pawn.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 7,
			:y_coord => 6,
			:piece_type => 'pawn',
			:image => 'black-pawn.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 0,
			:y_coord => 7,
			:piece_type => 'rook',
			:image => 'black-rook.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 1,
			:y_coord => 7,
			:piece_type => 'knight',
			:image => 'black-knight.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 2,
			:y_coord => 7,
			:piece_type => 'bishop',
			:image => 'black-bishop.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 3,
			:y_coord => 7,
			:piece_type => 'queen',
			:image => 'black-queen.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 4,
			:y_coord => 7,
			:piece_type => 'king',
			:image => 'black-king.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 5,
			:y_coord => 7,
			:piece_type => 'bishop',
			:image => 'black-bishop.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 6,
			:y_coord => 7,
			:piece_type => 'knight',
			:image => 'black-knight.gif'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 7,
			:y_coord => 7,
			:piece_type => 'rook',
			:image => 'black-rook.gif'
			)
	end

	def self.is_move_allowed?(piece_id, new_x, new_y)
		# need to check the following:
		#   - is move permitted for that piece according to piece rules?
		# 	- is the move obstructed by another piece?
		piece = Piece.find(piece_id)
		if piece.piece_type == 'pawn'
			return legit_moves_for_pawn(piece_id).include? [new_x, new_y]
		end
	end

	private

		def self.legit_moves_for_pawn(piece_id)
			# currently checks for boundary, and 
			# directionality based on color
			#
			# does NOT currently check the following:
			# - obstructing piece
			# - only move 2 places on first move
			# - move diagonal to take another piece
			piece = Piece.find(piece_id)
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
