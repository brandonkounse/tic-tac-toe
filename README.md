# Tic-Tac-Toe

This version of Tic-Tac-Toe is played via the terminal and written in `Ruby`. A new game can be started by creating a new instance of `TicTacToe`, adding two `Players` via the initializer, and calling the `#play` method:

```ruby
game = TicTacToe.new(Player.new('name', 'X'), Player.new('name', 'O'))
game.play
```

The `Player` object can accept a `string` or `number` as the name and player piece. So instead of playing with `X's and O's`, it can be:

```ruby
Player.new(42, '#') or Player.new('!!', '17')
```

The game follows the typical ruleset. Three symbols in a row means the player that own's that symbol is the winner. Likewise, if the board is full and there is no winner, the game is a draw.

More information about TicTacToe can be found on [Wikipedia](https://en.wikipedia.org/wiki/Tic-tac-toe).
