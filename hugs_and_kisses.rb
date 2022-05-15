# Start a game of Tic-Tac-Toe
class TicTacToe
  @@number_of_games = 0

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @@number_of_games += 1
    @game_board = *(1..9)
    @available_numbers = *(1..9)
    @played_turns = 0
    @turn = 1
  end

  def start
    puts "Game #{@@number_of_games} will start now. The score is #{@player1.wins} - #{@player2.wins}."
    enter
    # tutorial if @@number_of_games == 1
    @game_board = Array.new(9, ' ')
    @@number_of_games.odd? ? turn_player1 : turn_player2
  end

  private

  def tutorial
    puts 'You will only see this explanation for the first game you play. See the game grid below:'
    draw_game_board(@game_board)
    enter
    puts 'You will be asked to enter a number corresponding to the square you want to play your symbol in.'
    puts 'After typing the number, press enter. You will see the move you have just played on the board.'
    puts "If there\'s a winner, you can see the result and choose to play a new game.\n
          The player that starts will alternate every game"
    puts "\nReady?! Be careful out there! Your opponent is always around to give you a kiss or hug of death...\n\n"
    enter
  end

  def enter
    puts 'Press "enter" to continue'
    gets
  end

  def turn_player1
    puts "#{@player1.name}, play your \"#{@player1.symbol}\", type and press enter:"
    choice = gets.chomp.to_i
    @available_numbers.include?(choice) ? @game_board[choice - 1] = @player1.symbol : turn_player1
    @available_numbers.delete(choice)
    draw_game_board(@game_board)
    turn_player2
  end

  def turn_player2
    puts "#{@player2.name}, play your \"#{@player2.symbol}\", type and press enter:"
    choice = gets.chomp.to_i
    @available_numbers.include?(choice) ? @game_board[choice - 1] = @player2.symbol : turn_player2
    @available_numbers.delete(choice)
    draw_game_board(@game_board)
    turn_player1
  end

  def check_result

    puts "no winner yet\n\n"
  end

  # takes an array with 9 numbers and draws the playing board
  def draw_game_board(input)
    print "\n"
    input.each_with_index do |value, i|
      print " #{value} "
      print ((i + 1) % 3).zero? ? "\n---+---+---\n" : '|' unless (i + 1) == 9
    end
    print "\n\n"
    check_result if @available_numbers.length < 7
  end
end

# Add a new player to the game with a name
class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @wins = 0
  end

  attr_accessor :wins
  attr_reader :symbol, :name

  def welcome
    puts "Welcome #{@name}! You will play \"#{@symbol}\"s.\n\n"
  end
end

puts "Welcome to Tic-Tac-Toe in Ruby 2022!\n\n"
puts 'Type the name of player 1 and press enter:'
player1 = Player.new(gets.chomp, 'X')
player1.welcome
puts 'Type the name of player 2 and press enter:'
player2 = Player.new(gets.chomp, 'O')
player2.welcome
game = TicTacToe.new(player1, player2)
game.start
