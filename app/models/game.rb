class Game < ActiveRecord::Base
	has_many :pieces
	belongs_to :user

	def initialize_the_board!
		self.pieces.create(
			:color => 'white',
			:x_coord => 0,
			:y_coord => 0,
			:piece_type => 'rook'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 1,
			:y_coord => 0,
			:piece_type => 'knight'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 2,
			:y_coord => 0,
			:piece_type => 'bishop'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 3,
			:y_coord => 0,
			:piece_type => 'queen'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 4,
			:y_coord => 0,
			:piece_type => 'king'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 5,
			:y_coord => 0,
			:piece_type => 'bishop'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 6,
			:y_coord => 0,
			:piece_type => 'knight'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 7,
			:y_coord => 0,
			:piece_type => 'rook'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 0,
			:y_coord => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 1,
			:y_coord => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 2,
			:y_coord => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 3,
			:y_coord => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 4,
			:y_coord => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 5,
			:y_coord => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 6,
			:y_coord => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x_coord => 7,
			:y_coord => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 0,
			:y_coord => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 1,
			:y_coord => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 2,
			:y_coord => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 3,
			:y_coord => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 4,
			:y_coord => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 5,
			:y_coord => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 6,
			:y_coord => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 7,
			:y_coord => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 0,
			:y_coord => 7,
			:piece_type => 'rook'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 1,
			:y_coord => 7,
			:piece_type => 'knight'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 2,
			:y_coord => 7,
			:piece_type => 'bishop'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 3,
			:y_coord => 7,
			:piece_type => 'queen'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 4,
			:y_coord => 7,
			:piece_type => 'king'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 5,
			:y_coord => 7,
			:piece_type => 'bishop'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 6,
			:y_coord => 7,
			:piece_type => 'knight'
			)
		self.pieces.create(
			:color => 'black',
			:x_coord => 7,
			:y_coord => 7,
			:piece_type => 'rook'
			)
	end
end
