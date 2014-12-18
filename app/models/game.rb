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

	def is_move_obstructed?(piece_id, new_x, new_y)
		# does the following operations:
		# - get all tile coordinates between current piece tile and destination tile (list A)
		# - gets coordinates of all pieces in game (list B)
		# - checks whether there is any overlap between list A and list B
		#      - if so, it returns 'true' (there is an obstruction)
		#  	   - if not, it returns 'false' (there is no obstruction)
		# - if destination tile is not on a horizontal / vertical / perfect diagonal relative
		#   to current piece tile, then 'nil' is returned (move isn't valid)
		current_piece = Piece.find(piece_id)

		# check that the destionation is a horizontal/vertical/diagonal
		# line away from current piece
		x_diff = current_piece.x_coord - new_x
		y_diff = current_piece.y_coord - new_y
		unless (x_diff == y_diff) || (x_diff == 0) || (y_diff == 0)
			return nil
		end

		# get list of coordinates of tiles between destionation tile
		# and current piece tile
		places_between = [ [new_x, new_y] ]
		back_to_start = false
		current_coordinates = [current_piece.x_coord, current_piece.y_coord]
		until back_to_start
			if new_x > current_piece.x_coord
				new_x = new_x - 1
			elsif new_x < current_piece.x_coord
				new_x = new_x + 1
			end

			if new_y > current_piece.y_coord
				new_y = new_y -  1
			elsif new_y < current_piece.y_coord
				new_y = new_y + 1
			end

			if current_coordinates == [new_x, new_y]
				back_to_start = true
			else
				places_between << [new_x, new_y]
			end
		end

		# get coordinates for all game pieces
		pieces = self.pieces.to_a
		all_piece_coordinates = pieces.map { |p| [p.x_coord, p.y_coord] }

		# check if any current game pieces overlap with 
		# the coordinates between target and current piece position
		obstruction = false
		all_piece_coordinates.each do |piece_coordinates|			
			if places_between.include? piece_coordinates
				obstruction = true
				break
			end		
		end
		return obstruction
	end

end
