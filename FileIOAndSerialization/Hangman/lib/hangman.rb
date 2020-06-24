
possible_words = File.open('5desk.txt').to_a
secret_word = possible_words[rand(0...possible_words.length)].chomp

p secret_word