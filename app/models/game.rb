class Game < ActiveRecord::Base
	has_many :pieces
	belongs_to :user

	def initialize_the_board!
		self.pieces.create(
			:color => 'white',
			:x => 0,
			:y => 0,
			:piece_type => 'rook'
			)
		self.pieces.create(
			:color => 'white',
			:x => 1,
			:y => 0,
			:piece_type => 'knight'
			)
		self.pieces.create(
			:color => 'white',
			:x => 2,
			:y => 0,
			:piece_type => 'bishop'
			)
		self.pieces.create(
			:color => 'white',
			:x => 3,
			:y => 0,
			:piece_type => 'queen'
			)
		self.pieces.create(
			:color => 'white',
			:x => 4,
			:y => 0,
			:piece_type => 'king'
			)
		self.pieces.create(
			:color => 'white',
			:x => 5,
			:y => 0,
			:piece_type => 'bishop'
			)
		self.pieces.create(
			:color => 'white',
			:x => 6,
			:y => 0,
			:piece_type => 'knight'
			)
		self.pieces.create(
			:color => 'white',
			:x => 7,
			:y => 0,
			:piece_type => 'rook'
			)
		self.pieces.create(
			:color => 'white',
			:x => 0,
			:y => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x => 1,
			:y => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x => 2,
			:y => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x => 3,
			:y => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x => 4,
			:y => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x => 5,
			:y => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x => 6,
			:y => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'white',
			:x => 7,
			:y => 1,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x => 0,
			:y => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x => 1,
			:y => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x => 2,
			:y => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x => 3,
			:y => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x => 4,
			:y => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x => 5,
			:y => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x => 6,
			:y => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x => 7,
			:y => 6,
			:piece_type => 'pawn'
			)
		self.pieces.create(
			:color => 'black',
			:x => 0,
			:y => 7,
			:piece_type => 'rook'
			)
		self.pieces.create(
			:color => 'black',
			:x => 1,
			:y => 7,
			:piece_type => 'knight'
			)
		self.pieces.create(
			:color => 'black',
			:x => 2,
			:y => 7,
			:piece_type => 'bishop'
			)
		self.pieces.create(
			:color => 'black',
			:x => 3,
			:y => 7,
			:piece_type => 'queen'
			)
		self.pieces.create(
			:color => 'black',
			:x => 4,
			:y => 7,
			:piece_type => 'king'
			)
		self.pieces.create(
			:color => 'black',
			:x => 5,
			:y => 7,
			:piece_type => 'bishop'
			)
		self.pieces.create(
			:color => 'black',
			:x => 6,
			:y => 7,
			:piece_type => 'knight'
			)
		self.pieces.create(
			:color => 'black',
			:x => 7,
			:y => 7,
			:piece_type => 'rook'
			)
	end
end
