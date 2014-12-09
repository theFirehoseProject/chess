class ChangePlayer2ToOpponent < ActiveRecord::Migration
  def change
  	rename_column :games, :player_2, :opponent_id
  end
end
