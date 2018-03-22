class Game

	def initialize
		@board = Board.new()
		@player1 = Player.new("white")
		@board_array = @board.board_array
	end

	def start 
		print_instructions()
		choose_opponents()
		@board.draw()

		puts "Player 1 (white) will go first"

		#while !(game_over?)
		switch_players()
		#@current_player.move(@board_array)
		#end
	end

	def print_instructions
		puts "Welcome to Chess!"

		puts "Chess is a two player strategy board game played on an 8x8 grid"
		puts "The objective is to checkmate the opponent's king by playing it under an inescapable threat of capture."
	end

	def choose_opponents
		puts "Choose your opponent (Player 2): "
		puts "1: Human"
		puts "2: Computer"
		get_opponent
	end

	def get_opponent
		opponent = gets.chomp
		if opponent == "1" || opponent.downcase == "human"
			@player2 = Player.new("black")
			@current_player = @player2
		elsif opponent == "2" || opponent.downcase == "computer"
			@player2 = Computer.new("black")
			@current_player = @player2
		else
			choose_opponents()
		end
	end

	def switch_players
		if @current_player == @player1
			@current_player = @player2
			puts "Current Player: Player 2"
		else
			@current_player = @player1
			puts "Current Player: Player 1"
		end
	end

	def game_over?
		if check_win()
			print_winner
			return true
		elsif tied_game()
			print_no_winner
			return true
		else
			return false
		end
	end

	def check_win

	end

	def check_mate?

	end

	def tied_game?

	end

	def print_winner
		if @current_player == @player1
			player = "Player 1"
		else 
			player = "Player 2"
		end

		puts "Congratulations #{player}!"
		puts "You Win!"
	end

	def print_no_winner
		puts "Tie!"
		puts "No Winner!"
	end

	def play_again?
		puts "___________________________"
		puts "Play Again? (y/n)"
		response = gets.chomp
		if (response.downcase.strip == "y" || response.downcase.strip == "yes")
			return true
		else
			return false
		end
	end

	def restart
		@board = Board.new()
		@player1 = Player.new("white")
		@board_array = @board.board_array

		start()
	end

end

class Board
	attr_accessor :board_array

	def initialize
		@board_array = [[" ", " ", " ", " ", " ", " ", " ", " "],
										[" ", " ", " ", " ", " ", " ", " ", " "],
										[" ", " ", " ", " ", " ", " ", " ", " "],
										[" ", " ", " ", " ", " ", " ", " ", " "],
										[" ", " ", " ", " ", " ", " ", " ", " "],
										[" ", " ", " ", " ", " ", " ", " ", " "],
										[" ", " ", " ", " ", " ", " ", " ", " "],
										[" ", " ", " ", " ", " ", " ", " ", " "]]
		add_white_pieces
	end

	def add_white_pieces
		@board_array[0][0] = Rook.new("white")
		@board_array[0][7] = Rook.new("white")

		@board_array[0][1] = Knight.new("white")
		@board_array[0][6] = Knight.new("white")

		@board_array[0][2] = Bishop.new("white")
		@board_array[0][5] = Bishop.new("white")		

		@board_array[0][3] = Queen.new("white")
		@board_array[0][4] = King.new("white")

		@board_array[1].each_with_index do |pawn,index|
			@board_array[1][index] = Pawn.new("white")
		end
	end

=begin
	def add_positions
		8.times do |i|
			8.times do |j|
				@board_array.push([i,j])
			end
		end
		puts @board_array.inspect
	end
=end

	def draw(array=@board_array)
		puts "    a   b   c   d   e   f   g   h  "
		puts "___________________________________"
		array.each_with_index do |subarr, i|
			print " #{i+1}  "
			subarr.each_with_index do |item, index|
				if index == 7
					print item.to_s
				else
					print item.to_s + " | "
				end
			end
			puts "\n___________________________________"
		end
	end
end

class ChessPiece
	attr_accessor :color

	def initialize(color)
		@color = color
	end
end

class King < ChessPiece
	def to_s
		return "\u2654" if @color == "white"
		return "\u265A"
	end
end

class Queen < ChessPiece
	def to_s
		return "\u2655" if @color == "white"
		return "\u265B"
	end
end

class Rook < ChessPiece
	def to_s
		return "\u2656" if @color == "white"
		return "\u265C"
	end
end

class Bishop < ChessPiece
end

class Knight < ChessPiece

end 

class Pawn < ChessPiece
	def to_s
		return "\u2659" if @color == "white"
		return "\u265F"
	end
end

class Player
	attr_accessor :player_moves, :color, :pieces

	def initialize(color)
		@color = color
		@pieces = []
		@player_moves = []

		add_pieces
	end

	def add_pieces

	end

	def move(board_array)

	end

	def valid_move?(move, board_array)

	end
end

class Computer < Player

	def move(board_array)

	end
end

game = Game.new
game.start