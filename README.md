Chesster!
---------
Chesster! is a Ruby on Rails app being developed as a group project by students on [The Firehose Project](http://www.thefirehoseproject.com).

See [wireframes](https://raw.githubusercontent.com/theFirehoseProject/chess/master/data/wireframes.pdf).

**Setting up a game board**

These instructions were provided by Ilya in a [recent branch](https://github.com/theFirehoseProject/chess/pull/6).

'''rails c
g = Game.create'''

 This creates a new game. Go into your browser and check http://localhost:3030/games/1 - it should display an empty board.

'''run g.initialize_the_board!'''

Reload the page - it should display the pieces.

'''g.pieces.last.update(:x_coord => 4, :y_coord => 3)'''

Reload the page (you just moved a piece).

These notes might be helpful to test out the game whilst the controllers are being developed. 
