class GamesController < ApplicationController
  def show
  	@game = Game.find(params[:id])
  	@pieces = @game.pieces
  	#@player1 = User.find(@game.user_id)
  	#@player2 = User.find(@game.opponent_id)
    @player1 = @game.user
    @player2 = @game.opponent
  end

  def new
  	@game = Game.new
  end

  def create  	
    new_opponent_id = game_params[:opponent_id]
  	@game = Game.create(:opponent_id => new_opponent_id, :user_id => current_user.id)
  	@game.initialize_the_board!
  	redirect_to game_path(@game)
  end

  private

  	def game_params
  		params.require(:game).permit(:opponent_id)
  	end

end
