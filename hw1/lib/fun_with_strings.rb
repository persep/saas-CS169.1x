module FunWithStrings
  def palindrome?
    s = self.gsub(/\W/, '').downcase
    s == s.reverse
  end

  def count_words
    s = self.gsub(/[^\w\s]/, '')  # anything that is NOT a word character OR a space character.
    words = s.downcase.split
    words_freq = Hash.new(0)
    words.each { |word|
      words_freq[word] += 1
    }
    words_freq
  end

  def anagram_groups
    self.split.group_by { |element| element.downcase.chars.sort }.values
  end

end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
