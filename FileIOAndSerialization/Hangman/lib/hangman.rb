class Hangman
	attr_reader :secret_word
	attr_reader :player_guess
	attr_reader :num_guesses
	def initialize()
		@secret_word = Hangman.get_secret_word('5desk.txt').downcase
		@secret_word_copy = @secret_word
		@player_guess = Array.new(secret_word.length)
		@num_guesses = (@secret_word.length * 1.5).round
		@attempted_letters = []
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
		@attempted_letters.push(char)
		while @secret_word.include?(char)
			@player_guess[@secret_word.index(char)] = char
			@secret_word.sub!(char, ' ')
		end
	end

	def display()
		puts '-----------------------------'
		puts "Number of guesses remaining: #{@num_guesses}"
		puts "You have tried these letters: #{@attempted_letters}"
		p @player_guess
		puts "What is your guess?"
	end

	def checkWin()
		unless @player_guess.include?(nil)
			p @player_guess
			p "You win!"
			p "You had #{@num_guesses} guesses remaining."
			return true
		end
		return false
	end

	def save_game()
		File.open('game', 'w+') do |f|
			Marshal.dump(self, f)
		end
	end

	def Hangman.load_game()
		File.open('game') do |f|
			return Marshal.load(f)
		end
	end

	def clear_game()
		begin 
			File.delete('game')
		rescue
		end
	end

	def play_game()
		puts "Type 'save' at any time to save the game."
		puts "Type 'clear' to clear the current save data."
		while @player_guess.include?(nil) || @num_guesses > 0
			self.display()
			input = gets.chomp.downcase
			case input
			when 'save' 
				self.save_game()
				return
			when 'clear' 
				self.clear_game()
				return
			else 
				self.update_guess(input)
			end

			@num_guesses -= 1 
			return if self.checkWin()
		end

		puts "Sorry! You lose."
		puts "The word was #{@secret_word_copy}"
	end
end


game = nil
begin
	game = Hangman.load_game()
rescue
	game = Hangman.new()
end
game.play_game()
