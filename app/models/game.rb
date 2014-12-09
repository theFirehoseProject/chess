class Game < ActiveRecord::Base
	has_many :pieces
	belongs_to :user
    belongs_to :player_2, :foreign_key => 'player_2', :class_name => User

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
end
