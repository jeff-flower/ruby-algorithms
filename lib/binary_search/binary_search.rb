# Implementation of binary search
# Works on a sorted array of integers
class BinarySearch
  def self.find(arr, target)
    left = 0
    right = arr.size - 1
    targetIndex = nil

    while left <= right && targetIndex.nil?
      mid = (left + right) / 2

      if arr[mid] === target
        targetIndex = mid
        next
      end

      left = mid + 1 if target > arr[mid]
      right = mid - 1 if target < arr[mid]
    end

    targetIndex.nil? ? left : targetIndex
  end

  # Given a sorted array and a target value
  # return the indices that define the starting and ending locations
  # of the target value in the array
  # If the target value is not found, return [nil, nil]
  # Items in array must be comparable
  # Examples
  # [1,2,3,3,3,4], target 3 => [2,4]
  # [3, 3, 3], target 3 => [0,2]
  # [1,2,3], target 4 => [nil, nil]
  def self.find_range(arr, target)
    left_most = find_left_most(arr, target)
    right_most = find_right_most(arr, target)

    [left_most, right_most]
  end

  # Given a sorted array of numbers
  # Compare the count of positive and negative numbers in the array
  # Return the count that is higher
  # If the counts are the same, return 0
  # 0 is neither negative or positive
  # Examples
  # find_minimum_count([-5, -4, 0, 1]) => 2
  # find_minimum_count([-5, -4, 0, 1, 2, 3]) => 3
  # find_minimum_count([-5, -4, 0, 1, 2]) => 0
  def self.find_minimum_count(arr)
    negative_count = negative_number_count(arr)
    positive_count = positive_number_count(arr)

    negative_count == positive_count ? 0 : [negative_count, positive_count].min
  end

  private

  # specialized method for use in finding ranges
  # uses binary search
  # when target is found continues to the left of the target
  def self.find_left_most(arr, target)
    left = 0
    right = arr.length - 1
    left_most = nil

    while left <= right
      mid = (left + right) / 2

      left = mid + 1 if arr[mid] < target
      right = mid - 1 if arr[mid] > target

      if arr[mid] == target
        left_most = mid
        right = mid - 1
      end
    end

    left_most
  end

  # specialized method for use in finding ranges
  # uses binary search
  # when target is found continues to the right of the target
  def self.find_right_most(arr, target)
    left = 0
    right = arr.length - 1
    right_most = nil

    while left <= right
      mid = (left + right) / 2

      left = mid + 1 if arr[mid] < target
      right = mid - 1 if arr[mid] > target

      if arr[mid] == target
        right_most = mid
        left = mid + 1
      end

    end

    right_most
  end

  def self.negative_number_count(arr)
    last_neg_index = last_negative_index(arr)

    last_neg_index + 1
  end

  def self.positive_number_count(arr)
    first_pos_index = first_positive_index(arr)

    arr.length - first_pos_index
  end

  # Given a sorted array of numbers
  # return the count of negative numbers
  # 0 is not considered negative
  def self.last_negative_index(arr)
    left = 0
    right = arr.length - 1
    last_negative_index = -1

    while left <= right
      mid = (left + right) / 2

      if arr[mid] >= 0
        right = mid - 1
        next
      end

      last_negative_index = mid
      # we know everything to the left of mid is negative b/c the array is sorted
      # keep looking to the right of mid for other negative numbers
      left = mid + 1
    end

    last_negative_index
  end

  def self.first_positive_index(arr)
    left = 0
    right = arr.length - 1
    first_positive_index = arr.length

    while left <= right
      mid = (left + right) / 2

      if arr[mid] <= 0
        left = mid + 1
        next
      end

      first_positive_index = mid
      # we know everything to the right of mid is positive b/c the array is sorted
      # keep searching to the left of mid for other positive numbers
      right = mid - 1

    end

    first_positive_index
  end
end
