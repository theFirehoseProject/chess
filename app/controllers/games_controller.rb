class GamesController < ApplicationController
  
  def show
  	@game = Game.find(params[:id])
  	@pieces = @game.pieces
  end



  def select
  	# add code to links identifying each individual piece
    # when user clicks link, pass x,y into url
    @piece = Piece.find(params[:id, :x_coord, :y_coord])
    # redirect to select page that displays piece with that x, y

  end


  def move
  	# Nan's assignment

  end




end
