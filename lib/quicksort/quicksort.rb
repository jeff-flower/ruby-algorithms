require 'pry-byebug'

class Quicksort
  # Sort the provided array in place
  # Contents of array must be sortable
  def self.sort(arr)
    quicksort(arr, 0, arr.length - 1)
  end

  # Internal helper for implementing quicksort recursively
  def self.quicksort(arr, low, high)
    if low < high
      pivot_index = partition(arr, low, high)
      quicksort(arr, 0, pivot_index - 1)
      quicksort(arr, pivot_index + 1, high)
    end
  end

  # Given an array and indices marking the bounds of the partition space
  # e.g. low points to the left most portion of the array to operate on
  # and right the right most
  # 3 things will be true when this method completes
  # 1. The mid point between low and high will contain the correct element
  # based on sorting rules
  # 2. All values to the left of the mid-point will be less than the value at the mid-point
  # (but not necessarily sorted)
  # 3. All values to the right of the mid-point will be greater than or equal to the value at the mid-point
  # (but not necessarily sorted)
  # Returns the index of the mid-point containing the properly positioned element
  # Example:
  # partition([2, 1, 5, 8, 6], 0, 2) => 1 
  # arr looks like this: [1, 2, 5, 8, 6]
  def self.partition(arr, low, high)
    pivot_index = (low + high) / 2

    pivot_value = arr[pivot_index]
    swap(arr, low, pivot_index) 

    left = low + 1
    right = high

    while left <= right
      while left <= right && arr[left] < pivot_value
        left += 1
      end

      while left <= right && arr[right] >= pivot_value
        right -= 1
      end

      if left < right
        swap(arr, left, right)
        left += 1
        right -= 1
      end
    end

    swap(arr, low, right)

    right
  end

  # swap the elements in array at indices a and b
  # example
  # swap([1,2,3], 0, 1) => [2, 1, 3]
  def self.swap(arr, a, b)
    arr[a], arr[b] = arr[b], arr[a]
  end

end