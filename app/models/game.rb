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
		['white', [0, 0], 'rook'],
		['white', [1, 0], 'knight'],
		['white', [2, 0], 'bishop'],
		['white', [3, 0], 'queen'],
		['white', [4, 0], 'king'],
		['white', [5, 0], 'bishop'],
		['white', [6, 0], 'knight'],
		['white', [7, 0], 'rook'],
		['white', [0, 1], 'pawn'],
		['white', [1, 1], 'pawn'],
		['white', [2, 1], 'pawn'],
		['white', [3, 1], 'pawn'],
		['white', [4, 1], 'pawn'],
		['white', [5, 1], 'pawn'],
		['white', [6, 1], 'pawn'],
		['white', [7, 1], 'pawn'],
		['black', [0, 7], 'rook'],
		['black', [1, 7], 'knight'],
		['black', [2, 7], 'bishop'],
		['black', [3, 7], 'queen'],
		['black', [4, 7], 'king'],
		['black', [5, 7], 'bishop'],
		['black', [6, 7], 'knight'],
		['black', [7, 7], 'rook'],
		['black', [0, 6], 'pawn'],
		['black', [1, 6], 'pawn'],
		['black', [2, 6], 'pawn'],
		['black', [3, 6], 'pawn'],
		['black', [4, 6], 'pawn'],
		['black', [5, 6], 'pawn'],
		['black', [6, 6], 'pawn'],
		['black', [7, 6], 'pawn']
	]

	def initialize_the_board!
		INITIAL_BOARD_PIECES.each do |piece|
			current_piece = piece[2]
			if current_piece == "pawn"
				self.pawns.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => Pawn.get_image(piece[0]))
			elsif current_piece == "rook"
				self.rooks.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => Rook.get_image(piece[0]))
			elsif current_piece == "knight"
				self.knights.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => Knight.get_image(piece[0]))
			elsif current_piece == "bishop"
				self.bishops.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => Bishop.get_image(piece[0]))
			elsif current_piece == "queen"
				self.queens.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => Queen.get_image(piece[0]))
			elsif current_piece == "king"
				self.kings.create(:color => piece[0], :x_coord => piece[1][0], :y_coord => piece[1][1], :image => King.get_image(piece[0]))	
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

		if !(((x_diff == y_diff) || (x_diff == 0) || (y_diff == 0)))
		# Raise a BIG exception	
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
				if x_diff == y_diff
					places_between << [new_x, new_y]
				else
					places_between << [current_piece.x_coord, new_y]
					places_between << [new_x, current_piece.y_coord]
				end
			end
		end
		
		# get coordinates for all game pieces
		pieces = self.pieces.to_a
		#puts pieces.inspect
		all_piece_coordinates = pieces.map { |p| [p.x_coord, p.y_coord] }
		# check if any current game pieces overlap with 
		# the coordinates between target and current piece position
		obstruction = false
		all_piece_coordinates.each do |piece_coordinates|
			is_current_piece = current_coordinates == piece_coordinates
			is_destination_piece = piece_coordinates == [new_x, new_y]	

			if x_diff == 0 && y_diff == 0
				obstruction = true
			end

			if places_between.include?(piece_coordinates) && !is_current_piece && !is_destination_piece				
				obstruction = true
				break
			end		
		end
		return obstruction
	end

end
