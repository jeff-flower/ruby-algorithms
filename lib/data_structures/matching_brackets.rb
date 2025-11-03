require './lib/data_structures/stack'

class MatchingBrackets
  @OPENING_CHARS = ['(', '[', '{']
  @CLOSING_CHARS = [')', ']', '}']
  @CLOSING_PAIRS = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }

  def self.is_match?(str)
    return false if str.length.odd? || str.empty?
    stack = Stack.new

    str.each_char do |char|
      return false unless is_opening_char?(char) || pair_closes?(stack.peek, char)
      stack.push(char) if is_opening_char?(char)
      stack.pop if is_closing_char?(char) && pair_closes?(stack.peek, char)

      # continue = case char
      # when opening char (returns true)
      # when closing char (returns true or false)
      # else fail immediately (returns false)
      # return false unless continue
    end

    stack.empty?
  end

  # return true if char is member of allowed opening chars
  def self.is_opening_char?(char)
    @OPENING_CHARS.include?(char)
  end

  def self.is_closing_char?(char)
    @CLOSING_CHARS.include?(char)
  end

  # return true if right closes off left
  # examples
  # closes?('(', ')') => true
  # closes?('(', '(') => false
  def self.pair_closes?(opening_char, closing_char)
    @CLOSING_PAIRS[opening_char] == closing_char 
  end

  def self.matching_pair?(left, right)
    case left
      when '(' 
        right == ')' 
      when '['
        right == ']'
      when '{'
        right == '}'
      else
        false
    end
  end

end