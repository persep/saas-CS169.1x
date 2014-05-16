module FunWithStrings
  def palindrome?
    s = self.gsub(/\W/, '').downcase
    s == s.reverse
  end

  def count_words
    words = self.split
    words_freq = Hash.new(0)
    words.each { |word|
      clean_words = word.gsub(/\W/, '').downcase
      words_freq[clean_words] += 1 if clean_words != ''
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
