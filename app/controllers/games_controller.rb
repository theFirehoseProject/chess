class GamesController < ApplicationController
  
  def new
    @game = Game.new
  end

  def create    
    new_opponent_id = game_params[:opponent_id]
    @game = Game.create(:opponent_id => new_opponent_id, :user_id => current_user.id)
    @game.initialize_the_board!
    @name =  @game.id.to_s
    # FIREBASE.push("/games/" + @game.id.to_s , { :game => @name, :time=>Time.now.to_i, :priority => 1 })
    redirect_to game_path(@game)
  end

  def show
  	@game = Game.find(params[:id])
  	@pieces = @game.pieces
  	#@player1 = User.find(@game.user_id)
  	#@player2 = User.find(@game.opponent_id)
    @player1 = @game.user
    @player2 = @game.opponent

    @current_user_color = @game.get_player_color(current_user.id)
    if @current_user_color == @game.player_turn
      @current_user_turn = true
    else
      @current_user_turn = false
    end 
  
  end


  def move
    @pieces = current_game.pieces
    @piece = Piece.find(params[:piece_id])
   
    FIREBASE.push("/games/",{:game=> current_game.id.to_s, :time=>Time.now.to_i, :x_coord=> @piece.x_coord, :y_coord=>@piece.y_coord})
    # FIREBASE.push("/games/",{:game=> current_game.id.to_s, :time=>Time.now.to_i, :pieces=>@pieces})
    # @piece = Piece.find(params[:piece_id])
    if ! @piece.move_piece!(params[:x_coord], params[:y_coord])
      flash[:notice] = "That was not a valid move"
    else
      @piece.game.next_player
    end
  # @game = Game.find(params[:id])  
  # :game=> @game,


   FIREBASE.push("/games/moves/",{:game=> current_game.id.to_s, :time=>Time.now.to_i, :image=>@piece.image, :piece_type=> @piece.type, :piece_id=> @piece.id, :x_coord=> @piece.x_coord, :y_coord=>@piece.y_coord})
   redirect_to game_path(@piece.game)
    # render "games/"+ @piece.game

  end

 
      
  private

  def current_game
    @current_game ||= Game.find(params[:id])
  end

	def game_params
		params.require(:game).permit(:opponent_id)
	end


end
