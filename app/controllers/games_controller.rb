class GamesController < ApplicationController
  
  def new
    @game = Game.new
  end

  def create    
    new_opponent_id = game_params[:opponent_id]
    @game = Game.create(:opponent_id => new_opponent_id, :user_id => current_user.id)
    @game.initialize_the_board!
    redirect_to game_path(@game)
  end

  def show
  	@game = Game.find(params[:id])
  	@pieces = @game.pieces
  	#@player1 = User.find(@game.user_id)
  	#@player2 = User.find(@game.opponent_id)
    @player1 = @game.user
    @player2 = @game.opponent
  end

  def select
    @game = Game.find(params[:id])
    @pieces = @game.pieces
    @piece = Piece.find(params[:piece_id])
    @piece_id = params[:piece_id]
    @x_coord = params[:x_coord]
    @y_coord = params[:y_coord]
  end

  def move
  	# Nan's assignment
  end



  private

	def game_params
		params.require(:game).permit(:opponent_id)
	end


end
