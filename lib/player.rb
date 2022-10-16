require './lib/display'

class Player

  include Display
  
  attr_accessor \
    :name, 
    :game_piece,
    :score
  
  @@other_game_piece = ""

  def initialize(player_number, name: set_player_name(player_number), piece: set_game_piece)
    @name          = name
    @game_piece    = piece
    @score         = 0
  end

  def set_player_name(player_number)
    banner
    prompt("Player #{player_number}: What is your name?")
  end

  def set_game_piece
    piece_set = false
    game_piece = ''

    until piece_set
      banner
      message = "#{@name}: Choose a single letter to represent your piece. \n"
      message += "It cannot be #{@@other_game_piece}" if @@other_game_piece != ""
      
      game_piece = prompt(message).upcase

      if game_piece =~ /^[A-Z]\b/ && game_piece != @@other_game_piece
        @@other_game_piece = game_piece
        piece_set = true
      else
        banner
        puts "Invalid piece, please choose a single letter"
        sleep(2)
      end
    end

    game_piece
  end
end