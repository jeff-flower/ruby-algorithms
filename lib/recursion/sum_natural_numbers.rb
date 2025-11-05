class SumNaturalNumbers
  # Calculate the sum of the first n natural numbers
  # Assumes input is >= 0
  # Recursive implementation
  def self.sum(num)
    return num if num == 0

    num + sum(num - 1)
  end
end