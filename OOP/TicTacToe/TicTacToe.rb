require_relative 'Board'
class TicTacToe


	def initialize() # Sets up a new TicTacToe game
		@past_moves = []
		@board = Board.new()
		@num_moves = 0
		@game_over = false

		p "Who is player 1? (X)"
		@p1 = gets.chomp
		p "Who is player 2? (O)"
		@p2 = gets.chomp

		@turn = @p1
		playGame()
	end

	def playGame()
		p "This game uses standard matrix indexing! Input your move as X,Y where X is the Xth row and Y is the Yth column."
		symbol = 'X'
		while @num_moves < 9 && @game_over == false
			p "#{@turn} make your move."

			@turn == @p1 ? symbol = 'X' : symbol = 'O' # Change symbol based on player turn

			move = gets.chomp.split(',').map {|x| x.to_i} # Convert input move to array of integers

			# Check that move is valid (Spot not taken and is within correct range)
			while @past_moves.include?(move) || move.any? {|e| e > 3 || e < 1}
				p "Thats not a valid move! Make sure the spot is not taken and you are within the valid indices!"
				move = gets.chomp.split(',').map {|x| x.to_i}
			end

			# Update parameters with new move
			@past_moves.push(move)
			@board.move(move, symbol)
			@num_moves += 1
			@board.display()

			if @board.checkWin? # End game if winner
				@game_over = true
				@winner = @turn
				p "#{@turn} wins!"
				return
			elsif @turn == @p1 # If no winner -> switch turns
				@turn = @p2
			else 
				@turn = @p1
			end
		end
		p "It's a tie!"
	end

end

newGame = TicTacToe.new()