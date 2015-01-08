
  
def legit_moves
x_init = 3
y_init = 4
squares = [1,2,3,4,5,6,7]
moves = []
squares.each do |n|
 
(x_init - n < 0)? x_opt1 = nil : x_opt1 = x_init - n
(y_init - n < 0)? y_opt1 = nil : y_opt1 = y_init - n
 
(x_init + n > 7)? x_opt2 = nil : x_opt2 = x_init + n
# (y_init - n < 0)? y_opt2 = nil : y_opt2 = y_init - n
 
# (x_init + n > 7)? x_opt3 = nil : x_opt3 = x_init + n
(y_init + n > 7)? y_opt3 = nil : y_opt3 = y_init + n
 
# (x_init - n < 0)? x_opt4 = nil : x_opt4 = x_init - n
# (y_init + n > 7)? y_opt4 = nil : y_opt4 = y_init + n
 
move1 = [x_opt1 , y_opt1]
move2 = [x_opt2 , y_opt1]
move3 = [x_opt2 , y_opt3]
move4 = [x_opt1 , y_opt3]
 

 
moves.push(move1, move2, move3, move4)

# moves.compact
 
moves.delete_if {|move| move.include?(nil)}

end
return moves
end
 
p legit_moves 


