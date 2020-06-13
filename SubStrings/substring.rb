

def get_substr_counts(*strings, words)
	counts = Hash.new(0)
	words.each do |word| 
		strings.each do |string|
			if string.include? word
				counts[word] += 1
			end
		end
	end
	counts
end

p get_substr_counts("bigword", "smallword", ["word", "small", "big"])