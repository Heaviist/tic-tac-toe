# Start a game of Tic-Tac-Toe
class TicTacToe
  @@number_of_games = 0

  def initialize
    @@number_of_games += 1
    @game_board = *(1..9)
    @available_numbers = *(1..9)
    @played_turns = 0
    @turn = 1
  end

  def start(player1, player2)
    puts "Game #{no_of_games} will start now. The score is #{player1.wins} - #{player2.wins}."
    enter
    #tutorial if @@number_of_games == 1

    @game_board = Array.new(9, ' ')
    play_game(player1, player2)
  end

  private

  def tutorial
    puts 'You will only see this explanation for the first game you play. See the game grid below:'
    draw_game_board(@game_board)
    enter
    puts 'You will be asked to enter a number corresponding to the square you want to play your symbol in.'
    puts 'After typing the number, press enter. You will see the move you have just played on the board.'
    puts "\nReady?! Be careful out there! Your opponent is always around to give you a kiss or hug of death...\n\n"
    enter
  end

  def enter
    puts 'Press "enter" to continue'
    gets
  end

  def no_of_games
    @@number_of_games
  end

  def play_game(player1, player2)
    ## @@number_of_games.odd? ? play_turn_p1 : play_turn_p2
    puts "#{player1.name}, play your #{player1.symbol}, type and press enter:"
    choice = gets.chomp.to_i
    @available_numbers.include?(choice) ? @game_board[choice - 1] = player1.symbol : play_game(player1, player2)
    @available_numbers.delete(choice)
    draw_game_board(@game_board)
    puts "#{player2.name}, play your #{player2.symbol}, type and press enter:"
    choice = gets.chomp.to_i
    @available_numbers.include?(choice) ? @game_board[choice - 1] = player2.symbol : play_game(player1, player2)
    @available_numbers.delete(choice)
    draw_game_board(@game_board)
    enter
  end

=begin
  def play_turn_p1
    puts "#{player1.name}: To place your \"#{player1.symbol}\", type your choice below and press enter."
    choice = gets.chomp

    check_result
    play_turn_p2
  end

  def play_turn_p2
    puts "#{player2.name}: To place your #{player2.symbol}, type your choice below and press enter."
    check_result
    play_turn_p1
  end

  def check_result
    @played_turns += 1
    @played_turns > 2 ? check_result : play_turn
  end
=end

  # takes an array with 9 numbers and draws the playing board
  def draw_game_board(input)
    print "\n"
    input.each_with_index do |value, i|
      print " #{value} "
      print ((i + 1) % 3).zero? ? "\n---+---+---\n" : '|' unless (i + 1) == 9
    end
    print "\n\n"
  end
end

# Add a new player to the game with a name
class Player
  @@players = 0
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @wins = 0
    @@players += 1
  end

  attr_accessor :wins
  attr_reader :symbol, :name

  def welcome
    puts "Welcome #{@name}! you are player #{@@players} and will play \"#{@symbol}\"s.\n\n"
  end
end

puts "Welcome to Tic-Tac-Toe in Ruby 2022!\n\n"
puts 'Type the name of player 1 and press enter:'
player1 = Player.new(gets.chomp, 'X')
player1.welcome
puts 'Type the name of player 2 and press enter:'
player2 = Player.new(gets.chomp, 'O')
player2.welcome
game = TicTacToe.new
game.start(player1, player2)
