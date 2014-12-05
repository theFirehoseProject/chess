module ApplicationHelper

	# returns css class string for current tile color, given the following params:
	# 	  first_tile_color - is the first tile on the row white? 
	# 	    			     if so, set this to 1, else set to 0
	# 	  column 		   - column number of tile (0-7)
	def tile_color(first_tile_white, column)
		if first_tile_white
			return column % 2 == 0 ? "white" : "black info"
		else
			return column % 2 == 0 ? "black info" : "white"
		end 		
	end
end
