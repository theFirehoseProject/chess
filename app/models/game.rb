class Game < ActiveRecord::Base
	has_many :pieces
	has_many :pawns
	has_many :rooks 
	has_many :queens
	has_many :kings
	has_many :knights
	has_many :bishops

	belongs_to :user
    belongs_to :opponent, :foreign_key => 'opponent_id', :class_name => User
	scope :for_user, lambda {|user_id| where("user_id = ? OR opponent_id = ?", user_id, user_id)}

	INITIAL_BOARD_PIECES = [
		['white', [0, 0], 'rook', 'white-rook.gif'],
		['white', [1, 0], 'knight', 'white-knight.gif'],
		['white', [2, 0], 'bishop', 'white-bishop.gif'],
		['white', [3, 0], 'queen', 'white-queen.gif'],
		['white', [4, 0], 'king', 'white-king.gif'],
		['white', [5, 0], 'bishop', 'white-bishop.gif'],
		['white', [6, 0], 'knight', 'white-knight.gif'],
		['white', [7, 0], 'rook', 'white-rook.gif'],
		['white', [0, 1], 'pawn', 'white-pawn.gif'],
		['white', [1, 1], 'pawn', 'white-pawn.gif'],
		['white', [2, 1], 'pawn', 'white-pawn.gif'],
		['white', [3, 1], 'pawn', 'white-pawn.gif'],
		['white', [4, 1], 'pawn', 'white-pawn.gif'],
		['white', [5, 1], 'pawn', 'white-pawn.gif'],
		['white', [6, 1], 'pawn', 'white-pawn.gif'],
		['white', [7, 1], 'pawn', 'white-pawn.gif'],
		['black', [0, 7], 'rook', 'black-rook.gif'],
		['black', [1, 7], 'knight', 'black-knight.gif'],
		['black', [2, 7], 'bishop', 'black-bishop.gif'],
		['black', [3, 7], 'queen', 'black-queen.gif'],
		['black', [4, 7], 'king', 'black-king.gif'],
		['black', [5, 7], 'bishop', 'black-bishop.gif'],
		['black', [6, 7], 'knight', 'black-knight.gif'],
		['black', [7, 7], 'rook', 'black-rook.gif'],
		['black', [0, 6], 'pawn', 'black-pawn.gif'],
		['black', [1, 6], 'pawn', 'black-pawn.gif'],
		['black', [2, 6], 'pawn', 'black-pawn.gif'],
		['black', [3, 6], 'pawn', 'black-pawn.gif'],
		['black', [4, 6], 'pawn', 'black-pawn.gif'],
		['black', [5, 6], 'pawn', 'black-pawn.gif'],
		['black', [6, 6], 'pawn', 'black-pawn.gif'],
		['black', [7, 6], 'pawn', 'black-pawn.gif']
	]

	def initialize_the_board!
		INITIAL_BOARD_PIECES.each do |piece|
			current_piece = piece[2]
			if current_piece == "pawn"
				self.pawns.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => piece[3])
			elsif current_piece == "rook"
				self.rooks.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => piece[3])
			elsif current_piece == "knight"
				self.knights.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => piece[3])
			elsif current_piece == "bishop"
				self.bishops.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => piece[3])
			elsif current_piece == "queen"
				self.queens.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => piece[3])
			elsif current_piece == "king"
				self.kings.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => piece[3])	
			end
		end
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

		# check that the destination is a horizontal/vertical/diagonal
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
