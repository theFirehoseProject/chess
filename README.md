Chesster!
---------
Chesster! is a Ruby on Rails app being developed as a group project by students on [The Firehose Project](http://www.thefirehoseproject.com).

See [wireframes](https://raw.githubusercontent.com/theFirehoseProject/chess/master/data/wireframes.pdf).

** Setting up a game board **

These instructions were provided by Ilya in a [recent branch](https://github.com/theFirehoseProject/chess/pull/6).

* run rails c in terminal
* run g = Game.create (creates new game go into your browser and check http://localhost:3030/games/1 - it should display an empty board)
* run g.initialize_the_board! in the terminal
* reload the page - it should display the pieces
* run g.pieces.last.update(:x_coord => 4, :y_coord => 3) and reload the page (you just moved a piece)

These notes might be helpful to test out the game whilst the controllers are being developed. 
