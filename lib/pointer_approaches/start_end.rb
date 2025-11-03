class StartEnd
  def self.find_target_sum(arr, target)
    left = 0
    right = arr.length - 1
    found = nil 

    while left < right && !found do
      sum = arr[left] + arr[right]
      found = [arr[left], arr[right]] if sum == target

      left += 1 if sum < target
      right -= 1 if sum > target
    end

    found
  end

  # Given a string, returns a new string with the order of the consonants in the string.
  # #Example: reverse_consonants("example") => "elapmxe"
  def self.reverse_consonants(str)

    reversedStr = str.dup

    left = 0 
    right = str.length - 1

    while left < right do
      if !consonant?(reversedStr[left])
        left += 1
        next
      end

      if !consonant?(reversedStr[right])
        right -= 1
        next
      end

      # both are consonants if this is reached
      swap(reversedStr, left, right)
      left += 1
      right -= 1
    end

    reversedStr
  end

  private

  def self.consonant?(char)
    re_vowel = /[aeiouAEIOU]/
    re_character = /[a-zA-Z]/

    re_character.match?(char) && !re_vowel.match?(char)
  end

  def self.swap(str, i, j)
    str[i], str[j] = str[j], str[i]
  end
end