class Board
	@latestMove = [nil, nil]


	def initialize()
		@rows = [[nil, nil, nil],[nil, nil, nil], [nil, nil, nil]]
	end

	def move(i, j, symbol) # Where i and j correspond to the ith row and jth column
		@rows[i-1][j-1] = symbol
	end

	def display()
		p @latestMove[0]
		p @latestMove[1]
		p @latestMove[2]
	end


end