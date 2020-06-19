class Board
	attr_accessor :latestMove
	@latestMove = [nil, nil]


	def initialize(arr = [[nil, nil, nil],[nil, nil, nil], [nil, nil, nil]])
		@rows = arr
	end

	def move(move, symbol) # Where i and j correspond to the ith row and jth column
		@latestMove = move
		@rows[move[0] - 1][move[1] - 1] = symbol

	end

	def display()
		p @rows[0]
		p @rows[1]
		p @rows[2]
	end

	def checkWin?()
		win = false
		# Checks if latest move is a winning move.
		return true if verticalWin?()
		return true if horizontalWin?()
		return true if diagonalWin1?()
		return true if diagonalWin2?()
		return false
	end

	def verticalWin?()
		x, y = @latestMove.map {|z| z-1} # Subtract 1 to convert to indexing starting at 0
		for i in 0..2
			return false if @rows[(x+i)%3][y].nil? || @rows[x][y] != @rows[(x+i)%3][y]
		end
		return true
	end

	def horizontalWin?() # Transpose the board and check for a vertical win then transpose back.
		@rows = @rows.transpose()
		@latestMove[0], @latestMove[1] = @latestMove[1], @latestMove[0]
		result = self.verticalWin?()
		@rows = @rows.transpose()
		@latestMove[0], @latestMove[1] = @latestMove[1], @latestMove[0]
		return result
	end

	def diagonalWin1?() 
		x, y = @latestMove.map {|z| z-1} # Subtract 1 to convert to indexing starting at 0
		# Not on diagonal -> return false 
		if @latestMove[0] != @latestMove[1] && (@latestMove[0] - @latestMove[1]).abs != 2 
			return false
		else
			for i in 0..2
				return false if @rows[(x+i)%3][(y+i)%3].nil? || @rows[(x+i)%3][(y+i)%3] != @rows[x][y]
			end
		end
		return true
	end

	def diagonalWin2?() 
		x, y = @latestMove.map {|z| z-1} # Subtract 1 to convert to indexing starting at 0

		# Not on diagonal -> return false 
		if @latestMove[0] != @latestMove[1] && (@latestMove[0] - @latestMove[1]).abs != 2 
			return false
		else
			for i in 0..2
				return false if @rows[(x-i)%3][(y+i)%3].nil? || @rows[(x-i)%3][(y+i)%3] != @rows[x][y]
			end
		end
		return true
	end

end

rows = [['X','X', 'X'], [nil ,'X', nil], ['O','O','X']]
board = Board.new(rows)
board.latestMove = [1,1]
board.display()
p board.diagonalWin1?()
p board.diagonalWin2?()

















