class Palindrome
  # Given a string, return true if the string is a palindrome
  # Assumes the string contains lower case English alphabet characters only
  # Examples
  # palindrome?("aba") => true
  # palindrome?("abc") => false
  def self.palindrome?(str)
    palindrome_helper(str, 0, str.length - 1)
  end

  # Optimize space complexity by tracking the start and end pointers of the string
  # This cuts down on space requirements by eliminating need to use slice
  def self.palindrome_helper(str, left, right)
    # Base case: string of length 1 or length zero is palindrome with itself
    return true if left >= right

    # Recursive case: beginning and end match and the rest of the string is a palindrome
    str[left] == str[right] && palindrome_helper(str, left + 1, right - 1)
  end
end