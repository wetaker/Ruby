class Hangman
	attr_reader :secret_word
	attr_reader :player_guess
	attr_reader :num_guesses
	def initialize()
		@secret_word = Hangman.get_secret_word('5desk.txt').downcase
		@player_guess = Array.new(secret_word.length)
		@num_guesses = (@secret_word.length * 1.5).round
	end


	def Hangman.get_secret_word(filename)
		possible_words = File.open(filename).to_a
		secret_word = ''
		while secret_word.length < 5 || secret_word.length > 12 
			secret_word = possible_words[rand(0...possible_words.length)].chomp
		end
		return secret_word
	end


	def update_guess(char)
		while @secret_word.include?(char)
			@player_guess[@secret_word.index(char)] = char
			@secret_word.sub!(char, ' ')
		end
	end

	def play_game()
		while @player_guess.include?(nil) || @num_guesses > 0
			p '-----------------------------'
			p "Number of guesses remaining: #{@num_guesses}"
			p @player_guess
			p "What is your guess?"
			self.update_guess(gets.chomp.downcase)
			@num_guesses -= 1 
			unless @player_guess.include?(nil)
				p "You win!"
				p "You had #{@num_guesses} guesses remaining."
				return
			end
		end

	end
end




game1 = Hangman.new()
p game1.secret_word
game1.play_game()
