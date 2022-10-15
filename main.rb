require './lib/player'
require './lib/tic_tac_toe'

p1 = Player.new(1)
p2 = Player.new(2)
game = TicTacToe.new(p1, p2)