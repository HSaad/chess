require "chess"


describe Game do
	#start method tests
	describe "start" do
		context "generates a new game" do
			before(:example) do
				@game = Game.new()
			end
			it "initializes board array" do
				#expect (@game.board_array).eql?([[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "]])
			end
		end
	end

	#game_over method tests
	describe ".game_over?" do
		before(:example) do
			@game = Game.new()
			#@game.current_player = Player.new("o")
		end

		context "given an initial game" do
			it "returns false" do
				#expect(@game.game_over?).to eql(false)
			end
		end

		context "given a horizonal win" do
			before(:example) do
				#@game.board_array = [[" ", "x", "x", "x", "x", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "]]
			end
			it "returns true" do
				#expect(@game.game_over?).to eql(true)
			end
		end

		#given vertical win
		#given diagonal ascending win
		#given diagonal descending win
		#given full board
		#given losing board

		context "given a random board" do
			before(:example) do
				#@game.board_array = [["x", " ", " ", "o", " ", "o", "o"],["o", "o", " ", " ", " ", " ", " "],["x", " ", "x", " ", " ", " ", " "], ["x", " ", " ", "x", " ", " ", " "],["x", " ", " ", " ", " ", " ", " "],["x", " ", " ", " ", " ", " ", " "]]
			end
			it "returns false" do
				#expect(@game.game_over?).to eql(false)
			end
		end
	end
end

describe Player do

	#initialize method tests
	describe "start" do
		context "generates a new player" do
			before(:example) do
				#@player = Player.new("x")
			end

			it "initializes player_moves" do
				#expect (@player.player_moves).eql?([])
			end

			it "sets the mark for player" do
				#expect (@player.mark).eql?("x")
			end
		end
	end

	#valid move tests
	describe ".valid_move" do
		before(:example) do
			#@player = Player.new('x')
			#@board = [["x", "x", "x", "x", "x", " ", " "],["x", " ", " ", " ", " ", " ", " "],["x", " ", " ", " ", " ", " ", " "], ["x", " ", " ", " ", " ", " ", " "],["x", " ", " ", " ", " ", " ", " "],["x", " ", " ", " ", " ", " ", " "]]
		end
		
		context "given a valid move" do
			it "returns true" do
				#expect(@player.valid_move?(2, @board)).to eql(true)
			end
		end

		context "given a valid move" do
			it "returns true" do
				#expect(@player.valid_move?(4, @board)).to eql(true)
			end
		end

		context "given an invalid move" do
			it "returns false" do
				#expect(@player.valid_move?(8, @board)).to eql(false)
			end
		end

		context "given an invalid move" do
			it "returns false" do
				#expect(@player.valid_move?(1, @board)).to eql(false)
			end
		end

		context "given an invalid move" do
			it "returns false" do
				#expect(@player.valid_move?("b", @board)).to eql(false)
			end
		end

	end
end

describe Board do

	#initialize method tests
	describe "start" do
		context "generates a new board" do
			before(:example) do
				@board = Board.new()
			end
			it "initializes board array" do
				#expect (@board.board_array).eql?([[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "]])
			end
		end
	end
end