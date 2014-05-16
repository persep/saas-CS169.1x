# Define a method hello(name) that takes a string representing a name and 
# returns the string "Hello, " concatenated with the name.

def hello(name)
	"Hello, " + name
end

raise "hello('persep') != 'Hello, persep'" unless hello('persep') == "Hello, persep"

# Define a method starts_with_consonant?(s) that takes a string and 
# returns true if it starts with a consonant and false otherwise. 
# (For our purposes, a consonant is any letter other than A, E, I, O, U.)
# NOTE: be sure it works for both upper and lower case and for nonletters!

def starts_with_consonant?(s)
	s =~/^[^aeiou\W]/i ? true : false
end


raise "starts_with_consonant?('persep') != true" unless starts_with_consonant?('persep') == true
raise "starts_with_consonant?('PERSEP') != true" unless starts_with_consonant?('PERSEP') == true
raise "starts_with_consonant?('apersep') != false" unless starts_with_consonant?('apersep') == false
raise "starts_with_consonant?('APERSEP') != false" unless starts_with_consonant?('APERSEP') == false
raise "starts_with_consonant?('#persep') != false" unless starts_with_consonant?('#persep') == false

# Define a method binary_multiple_of_4?(s) that takes a string and 
# returns true if the string represents a binary number that is a multiple of 4. 
# NOTE: be sure it returns false if the string is not a valid binary number!

def binary_multiple_of_4?(s)
	if s =~ /\b[01]+\b/
		return s.to_i(2) % 4 == 0 ? true : false
	else
		return false
	end
end

raise "binary_multiple_of_4?('100') != true" unless binary_multiple_of_4?('100') == true
raise "binary_multiple_of_4?('105') == true" unless binary_multiple_of_4?('101') == false
raise "binary_multiple_of_4?('a100') != false" unless binary_multiple_of_4?('a100') == false
raise "binary_multiple_of_4?('100a') != false" unless binary_multiple_of_4?('100a') == false