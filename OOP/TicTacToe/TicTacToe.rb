require_relative 'Board'
class TicTacToe


	def initialize()
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
			@turn == @p1 ? symbol = 'X' : symbol = 'O'
			move = gets.chomp.split(',').map {|x| x.to_i}
			while @past_moves.include?(move)
				p "That spot is taken! Choose another square."
				move = gets.chomp.split(',').map {|x| x.to_i}
			end
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
		p "It's a tie!" if @game_over == false
	end

end

newGame = TicTacToe.new()
newGame.playGame()