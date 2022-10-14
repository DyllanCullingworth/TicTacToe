require_relative 'lib/player'
require_relative 'lib/tic_tac_toe'



def clear
  print "\e[2J\e[H"
end

p1 = Player.new(1)
p2 = Player.new(2)
game = TicTacToe.new(p1, p2)