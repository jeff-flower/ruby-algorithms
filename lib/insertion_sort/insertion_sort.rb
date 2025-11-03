require 'pry-byebug'

# Implementation of InsertionSort
# arguments
# arr: array of integers to sort
# &shift_right(a, b): move a to the right if shift_right returns true
# example: ascending sort, return a > b, descending sort, return a < b
module InsertionSort
  def self.sort( arr, &shift_right)
    # at the end of each loop, the first indices 0 through i are sorted
    (1...arr.length).each do |i|
      current = arr[i]
      j = i - 1

      while j >= 0 && shift_right.call(arr[j], current)
        arr[j + 1] = arr[j]
        j -= 1
      end

      # put current in its proper place
      # items 0 through j + 1 are now sorted
      arr[j + 1] = current
    end
  end
end
