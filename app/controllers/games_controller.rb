class GamesController < ApplicationController
  
  def show
  	@game = Game.find(params[:id])
  	@pieces = @game.pieces
    # @piece = Piece.find(params[:id])
  end



  def select
    # @game = Game.find(params[:id])
    # @pieces = @game.pieces
    @piece = Piece.find(params[:id])

  end


  def move
  	# Nan's assignment

  end




end
