# Start a game of Tic-Tac-Toe
class TicTacToe
  @@number_of_games = 0
  def initialize
    @@number_of_games += 1
  end

  def start(player1, player2)
    puts "Game #{no_of_games} will start now. The score is #{player1.wins} - #{player2.wins}"
  end

  private

  def no_of_games
    @@number_of_games
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

  def welcome
    puts "Welcome #{@name}! you are player #{@@players} and will play '#{@symbol}'s."
  end
end

puts 'Type the name of player 1 and press enter:'
player1 = Player.new(gets.chomp, 'X')
player1.welcome
puts 'Type the name of player 2 and press enter:'
player2 = Player.new(gets.chomp, 'O')
player2.welcome
game = TicTacToe.new
game.start(player1, player2)
