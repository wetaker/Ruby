class Board
	attr_accessor :latestMove
	@latestMove = [nil, nil] # Position of most recently played move


	def initialize(arr = [[nil, nil, nil],[nil, nil, nil], [nil, nil, nil]])
		@rows = arr
	end

	def move(move, symbol) # Where i and j correspond to the ith row and jth column
		@latestMove = move
		@rows[move[0] - 1][move[1] - 1] = symbol

	end

	def display() # Displays the board
		p @rows[0]
		p @rows[1]
		p @rows[2]
	end

	def checkWin?() # Checks if latest move is a winning move.

		win = false
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


















