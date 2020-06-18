
class TicTacToe
	board = Board.new()


	def initialize()
		@num_moves = 0
		@game_over = false

		p "Who is player 1? (X)"
		@p1 = gets.chomp
		p "Who is player 2? (O)"
		@p2 = gets.chomp

		@turn = @p1

		TicTacToe.playGame()
	end

	def self.playGame()
		while num_moves < 9 && game_over == false
			p "#{@turn} make your move."
			move = gets.chomp
			board.move(move)
			if board.checkWin?(move) # End game if winner
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
	end

end