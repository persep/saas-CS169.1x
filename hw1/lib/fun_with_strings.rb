module FunWithStrings
  def palindrome?
    s = self.gsub(/\W/, '').downcase
    s == s.reverse
  end

def count_words
    s = self.gsub(/[^\w\s]/, '')  # anything that is NOT a word character OR a space character.
    words = s.downcase.split
    # The inject method takes one parameter (the object to build up, in this case a hash), 
    # and a block specifying the action to take on each item. The block takes two parameters: 
    # the object being built up (the hash), and one of the items from the array.
    # The next time it calls the block, inject uses the value it got from the block the 
    # last time it called the block, in this case the hash
    words.inject(Hash.new(0)) { |hash,word| hash[word] += 1; hash }
  end

  def anagram_groups
    self.split.group_by { |element| element.downcase.chars.sort }.values
  end

end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
