require './lib/display'
require './lib/game_logic'

class Player

  include Display
  include GameLogic
  
  attr_accessor \
    :name, 
    :game_piece,
    :score
  
  @@other_game_piece = ""

  def initialize(player_number)
    set_player_name(player_number)
    set_game_piece
    @score = 0
  end

  def set_player_name(player_number)
    banner
    puts "Player #{player_number}: What is your name?"
    @name = gets.chomp
  end

  def set_game_piece
    piece_set = false

    until piece_set
      banner
      puts "#{@name}: Choose a single letter to represent your piece."
      puts "It cannot be #{@@other_game_piece}" if @@other_game_piece != ""
      @game_piece = gets.chomp.upcase

      if @game_piece =~ /^[A-Z]\b/ && @game_piece != @@other_game_piece
        @@other_game_piece = @game_piece
        piece_set = true
      else
        banner
        puts "Invalid piece, please choose a single letter"
        sleep(2)
      end
    end
  end
end