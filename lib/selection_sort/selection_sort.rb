require 'pry-byebug'

# Implementation of selection sort
module SelectionSort
  # arr: array of integer
  # &comparison func: takes two arguments, a and b, returns true if a should be given priority over b
  # example: to sort ascending, return a < b, descending, a > b
  def self.sort(arr, &comparison)
    # During the sort the array is partitioned into two sections: sorted and unsorted
    # Sorted items are placed on the left of the array
    (0...arr.size - 1).each do |start_of_unsorted|
      min_index = start_of_unsorted
      (start_of_unsorted + 1...arr.size).each do |current_index|
        min_index = current_index if comparison.call(arr[current_index], arr[min_index])
      end

      swap(arr, start_of_unsorted, min_index) if start_of_unsorted != min_index
    end
  end

  # swaps the values at index_1 and index_2 in arr
  def self.swap(arr, index1, index2)
    value1 = arr[index1]

    arr[index1] = arr[index2]
    arr[index2] = value1
  end

  private_class_method :swap
end
