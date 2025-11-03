require 'pry-byebug'

# Bubble sort in ascending order
module BubbleSort
  # integer_array: list of integers (duplicates ok)
  # comparison: boolean block that takes two arguments are returns true if the first
  # argument fails in comparison to the second argument (likely less or greater than)
  def self.sort(integer_array, &comparison)
    # TODO: Arugment checking:
    # array has length > 1

    # TODO: optimization: end if no swaps made during an interation
    (0...integer_array.length).reverse_each do |stop_index|
      (0...stop_index).each do |current|
        swap(integer_array, current, current + 1) if comparison.call(integer_array[current], integer_array[current + 1])
      end
    end
  end

  # iterates through array in opposite order with same results
  # comparison and swap methods do not need to change if we're careful about what they
  # are called with
  def self.sort_two(integer_array, &comparison)
    (0...integer_array.length - 1).each do |stop_index|
      ((stop_index + 1)...integer_array.length).reverse_each do |current|
        swap(integer_array, current - 1, current) if comparison.call(integer_array[current - 1],
                                                                     integer_array[current])
      end
    end
  end

  def self.swap(arr, index1, index2)
    a = arr[index1]
    arr[index1] = arr[index2]
    arr[index2] = a
  end

  private_class_method :swap
end
