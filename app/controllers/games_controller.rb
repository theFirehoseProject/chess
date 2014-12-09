class GamesController < ApplicationController
  
  def show
  	@game = Game.find(params[:id])
  	@pieces = @game.pieces
  end


  def select
    @piece = Piece.find(params[:piece_id])
    @piece_id = params[:piece_id]
    @x_coord = params[:x_coord]
    @y_coord = params[:y_coord]
  end


  def move
  	# Nan's assignment

  end

  private







end
