# frozen_string_literal: true

WINNING_LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

# Start a game of Tic-Tac-Toe
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @number_of_games = 1
    @game_board = *(1..9)
    @available_numbers = *(1..9)
  end

  def start
    puts "Game #{@number_of_games} will start now."
    puts "The current score is #{@player1.wins} (#{@player1.name}) - #{@player2.wins} (#{@player2.name})."
    enter
    tutorial if @number_of_games == 1
    @game_board = Array.new(9, ' ')
    @number_of_games.odd? ? turn(@player1) : turn(@player2)
  end

  private

  def turn(player)
    player_input(player)
    draw_game_board(@game_board)
    check_result(player) ? game_result(player) : turn(switch(player))
  end

  def player_input(player)
    puts "#{player.name}, play your \"#{player.symbol}\"! Type the number of a free square and press enter:"
    print 'Available squares '
    @available_numbers.each { |n| print "- #{n} " }
    print "\n"
    choice = gets.chomp.to_i
    @available_numbers.include?(choice) ? @game_board[choice - 1] = player.symbol : player_input(player)
    @available_numbers.delete(choice)
  end

  def check_result(player)
    result = WINNING_LINES.any? do |line|
      line.all? { |index| @game_board[index] == player.symbol }
    end
    return result unless result == false && @available_numbers.empty?

    puts "That\'s a draw!"
    new_game?
  end

  def game_result(player)
    puts "#{player.name} has won!"
    player.wins += 1
    new_game?
  end

  def new_game?
    puts 'Do you want to play a new game (y/n)?'
    if gets.chomp == 'y'
      reset
    else
      puts "The final score is #{@player1.wins} (#{@player1.name}) - #{@player2.wins} (#{@player2.name})."
    end
  end

  def reset
    @number_of_games += 1
    @available_numbers = *(1..9)
    start
  end

  def switch(player)
    player == @player1 ? @player2 : @player1
  end

  # takes an array with 9 numbers and draws the playing board
  def draw_game_board(input)
    print "\n"
    input.each_with_index do |value, i|
      print " #{value} "
      print ((i + 1) % 3).zero? ? "\n---+---+---\n" : '|' unless (i + 1) == 9
    end
    print "\n\n"
  end

  def tutorial
    puts 'You will only see this explanation for the first game you play. See the game grid below:'
    draw_game_board(@game_board)
    enter
    puts 'You will be asked to enter a number corresponding to the square you want to play your symbol in.'
    puts 'After typing the number, press enter. You will see the move you have just played on the board.'
    puts "If there\'s a winner, you can see the result and choose to play a new game."
    puts 'The player that starts will alternate every game'
    puts "\nReady?! Be careful out there! Your opponent is always around to give you a kiss or hug of death...\n\n"
    enter
  end

  def enter
    puts 'Press "enter" to continue'
    gets
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
game = Game.new(player1, player2)
game.start
