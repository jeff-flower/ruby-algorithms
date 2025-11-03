class AnchorRunner
  def self.partition_ones(arr)
    anchor = 0

    arr.each_with_index do |value, runner|
      if value != 1
        swap(arr, anchor, runner)
        anchor += 1
      end
    end
  end

  # Give a sorted array
  # Return a count of the unique items in an array and modify the array in place
  # moving all unique elements to the begining of the array
  # and preserving the order of the unique items
  # Items in the array must be comparable
  # What comes after the unique items is not guaranteed
  # Example: compress_distinct([1, 3, 5, 5, 7]) => 4
  # array will now be: [1, 3, 5, 7, _]
  def self.compress_distinct!(arr)
    anchor = 0

    arr.each do |value|
      next if arr[anchor] === value

      anchor += 1
      arr[anchor] = value
    end

    arr.length > 0 ? anchor + 1 : 0
  end 

  private

  def self.swap(arr, i, j)
    arr[i], arr[j] = arr[j], arr[i]
  end
end