class SetUpStiForPieces < ActiveRecord::Migration
  def change
  	remove_column :pieces, :piece_type
  	add_column :pieces, :type, :string
  end
end
