class Game

	def initialize
		@board = Board.new()
		@player1 = Player.new("white")
		@board_array = @board.board_array

		@player1.add_pieces(@board_array)
	end

	def start 
		print_instructions()
		choose_opponents()
		@board.draw()

		puts "Player 1 (white) will go first"

		#while !(game_over?)
		switch_players()
		@current_player.ask_piece(@board_array)
		#last_move = @current_player.player_moves.last
		#@board_array[last_move[1]][last_move[0]] = @current_player.mark
		#@board.draw(@board_array)
		#end

		#restart if play_again?
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
		elsif opponent == "2" || opponent.downcase == "computer"
			@player2 = Computer.new("black")
		else
			choose_opponents()
		end

		@current_player = @player2
		@player2.add_pieces(@board_array)
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
		add_black_pieces
	end

	def add_white_pieces
		@board_array[0][0] = Rook.new("white", [0,0])
		@board_array[0][7] = Rook.new("white", [0,7])

		@board_array[0][1] = Knight.new("white",[0,1])
		@board_array[0][6] = Knight.new("white", [0,6])

		@board_array[0][2] = Bishop.new("white", [0,2])
		@board_array[0][5] = Bishop.new("white", [0,5])		

		@board_array[0][3] = Queen.new("white", [0,3])
		@board_array[0][4] = King.new("white", [0,4])

		@board_array[1].each_with_index do |pawn,index|
			@board_array[1][index] = Pawn.new("white", [1,index])
		end
	end

	def add_black_pieces
		@board_array[7][0] = Rook.new("black", [7,0])
		@board_array[7][7] = Rook.new("black", [7,7])

		@board_array[7][1] = Knight.new("black", [7,1])
		@board_array[7][6] = Knight.new("black", [7,6])

		@board_array[7][2] = Bishop.new("black", [7,2])
		@board_array[7][5] = Bishop.new("black", [7,5])		

		@board_array[7][3] = Queen.new("black", [7,3])
		@board_array[7][4] = King.new("black", [7,4])

		@board_array[6].each_with_index do |pawn,index|
			@board_array[6][index] = Pawn.new("black", [6,index])
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
	attr_accessor :color, :position

	def initialize(color, position)
		@color = color
		@position = position
	end
end

class King < ChessPiece

	def possible_moves(position=@position)
		array_positons = []
				
		return array_positons
	end

	def to_s
		return "\u2654" if @color == "white"
		return "\u265A"
	end
end

class Queen < ChessPiece

	def possible_moves(position=@position)
		array_positons = []
				
		return array_positons
	end

	def to_s
		return "\u2655" if @color == "white"
		return "\u265B"
	end
end

class Rook < ChessPiece
	def possible_moves(position=@position)
		array_positons = []
				
		return array_positons
	end

	def to_s
		return "\u2656" if @color == "white"
		return "\u265C"
	end
end

class Bishop < ChessPiece
	def possible_moves(position=@position)
		array_positons = []
				
		return array_positons
	end

	def to_s
		return "\u2657" if @color == "white"
		return "\u265D"
	end
end

class Knight < ChessPiece

	def possible_moves(position=@position)
		array_positons = []
		array_positons.push([position[0] + 2, position[1] + 1]) if position[0] + 2 < 8 && position[1] + 1 < 8
		array_positons.push([position[0] + 1, position[1] + 2]) if position[0] + 1 < 8 && position[1] + 2 < 8
		array_positons.push([position[0] - 2, position[1] - 1]) if position[0] - 2 >= 0 && position[1] - 1 >= 0
		array_positons.push([position[0] - 1, position[1] - 2]) if position[0] - 1 >= 0 && position[1] - 2 >= 0
		array_positons.push([position[0] + 2, position[1] - 1]) if position[0] + 2 < 8 && position[1] - 1 >= 0
		array_positons.push([position[0] - 2, position[1] + 1]) if position[0] - 2 >= 0 && position[1] + 1 < 8
		array_positons.push([position[0] + 1, position[1] - 2]) if position[0] + 1 < 8 && position[1] - 2 >= 0
		array_positons.push([position[0] - 1, position[1] + 2]) if position[0] - 1 >= 0 && position[1] + 2 < 8
		return array_positons
	end

	def to_s
		return "\u2658" if @color == "white"
		return "\u265E"
	end
end 

class Pawn < ChessPiece

	def possible_moves(position=@position)
		array_positons = []

		return array_positons
	end

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
	end

	def add_pieces(board)
		#add pieces to array depending on color
		if color == "white"
			7.times do |index|
				@pieces.push(board[0][index])
				@pieces.push(board[1][index])
			end
		else
			7.times do |index|
				@pieces.push(board[6][index])
				@pieces.push(board[7][index])
			end
		end
	end

	def ask_piece(board_array)
		puts "Make your move: "
		puts "Pick a chess piece to move "
		puts "Column (a-h): "
		col = gets.chomp
		puts "Row (1-8): "
		row = gets.chomp

		if valid_piece?(col, row ,board_array)
			puts "Valid Piece"
			move(board_array)
		else
			ask_piece(board_array)
		end

	end

	def move(board_array)
		puts "Move (column, row): "
		move = gets.chomp

		if valid_move(move, board_array)
			puts "Your Move: #{move}"
			return true
		else 
			move(board_array)
			return false
		end
	end

	def valid_piece?(col, row ,board_array)
		column = col.strip.downcase
		row_num = row.to_i - 1
		column_num = ["a", "b", "c", "d", "e", "f", "g", "h"].index(column)
		if column.size != 1 || !(column.between?("a","h")) #col is not from a - h
			return false
		elsif row_num > 8 || row_num < 0
			return false
		elsif board_array[row_num][column_num] != " "
			piece = board_array[row_num][column_num]
			#check that the piece there matches the correct players
			if @color == piece.color
				puts piece.to_s
				return true
			else 
				return false
			end
		else 
			return false
		end
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