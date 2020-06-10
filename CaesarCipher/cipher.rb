

def caesar_encrypt(string, shift)
  alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
              'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  array_rep = string.split("");
  p array_rep


  encrypted_arr = [] 
  array_rep.each do |char|
  	p char
    unless alphabet.include?(char.downcase)
    	encrypted_arr.append(char)
    	next
    end
	char_upcase = char.upcase === char  # Store whether uppcase or not
	ind = alphabet.find_index(char.downcase)
	new_ind = (ind + shift) % alphabet.length; # Apply shift
	encrypted_arr.append(char_upcase ? alphabet[new_ind].upcase : alphabet[new_ind]) # Return value and apply case
  end
  encrypted_arr.join("");
end


p caesar_encrypt("frog balloons", 1);
