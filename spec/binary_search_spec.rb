require './lib/binary_search'
describe BinarySearch do
  describe '#find' do
    it 'returns the index of a value when it exists in a sorted array' do
      arr = [1, 2, 3, 4, 5, 6, 7, 8]

      expect(BinarySearch.find(arr, 5)).to eq 4
    end

    # TODO: item not found but should be at beginning or end or middle
    it 'returns the index where the item should be located if the item is not in the array' do
      arr = [1, 2, 3, 4, 6, 7, 8]

      expect(BinarySearch.find(arr, 99)).to be 7
    end

    it 'returns 0 when the array is empty' do
      arr = []

      expect(BinarySearch.find(arr, 99)).to be 0
    end

    it 'finds an item at the beginning of the array' do
      arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

      expect(BinarySearch.find(arr, 1)).to be 0
    end

    it 'finds an item at the end of the array' do
      arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

      expect(BinarySearch.find(arr, 9)).to be 8
    end

    it 'finds an item in the middle of the array' do
      arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

      expect(BinarySearch.find(arr, 5)).to be 4
    end
  end

  describe '#find_range' do
    it 'returns a range when a range is present' do
      arr = [1, 2, 3, 3, 3, 3, 4, 5]

      expect(BinarySearch.find_range(arr, 3)).to eql [2, 5]
    end

    it 'returns a range when the range is to the left of the mid-point' do
      arr = [3, 3, 3, 4, 5, 6, 6, 8]

      expect(BinarySearch.find_range(arr, 3)).to eql [0, 2]
    end

    it 'returns a range when the range is to the right of the mid-point' do
      arr = [3, 3, 3, 4, 5, 6, 6, 8]

      expect(BinarySearch.find_range(arr, 6)).to eql [5, 6]
    end

    it 'returns a range when all numbers are the same' do
      arr = [3, 3, 3, 3, 3]

      expect(BinarySearch.find_range(arr, 3)).to eql [0, 4]
    end

    it 'returns a range for when the target occurs once' do
      arr = [3, 3, 3, 4, 5, 6, 6, 8]

      expect(BinarySearch.find_range(arr, 5)).to eql [4, 4]
    end

    it 'returns nil indices when there is no range' do
      arr = [3, 3, 3, 4, 5, 6, 6, 8]

      expect(BinarySearch.find_range(arr, 7)).to eql [nil, nil]
    end

    it 'returns a range when the only occurence is at the beginning' do
      arr = [1, 3, 3, 4, 5, 6, 6, 8]

      expect(BinarySearch.find_range(arr, 1)).to eql [0, 0]
    end

    it 'returns a range when the only occurence is at the end' do
      arr = [1, 3, 3, 4, 5, 6, 6, 8]

      expect(BinarySearch.find_range(arr, 8)).to eql [7, 7]
    end

    it 'returns nil for an empty array' do
      arr = []

      expect(BinarySearch.find_range(arr, 8)).to eql [nil, nil]
    end

    it 'finds a value in an array of length 1' do
      arr = [1]

      expect(BinarySearch.find_range(arr, 1)).to eql [0, 0]
    end
  end

  describe '#find_minimum_count' do
    context 'a single zero in the array' do
      it 'returns the count of the positive numbers when the negative count is greater' do
        arr = [-5, -4, -3, -2, -1, 0, 1, 2]

        expect(BinarySearch.find_minimum_count(arr)).to be 2
      end

      it 'returns the count of the negative numbers when the positive count is greater' do
        arr = [-1, 0, 1, 2, 3, 4]

        expect(BinarySearch.find_minimum_count(arr)).to be 1
      end

      it 'returns 0 when the count is the same' do
        arr = [-2, -1, 0, 1, 2]

        expect(BinarySearch.find_minimum_count(arr)).to be 0
      end
    end

    context 'multiple zeroes' do
      it 'returns the count of the positive numbers when the negative count is greater' do
        arr = [-5, -4, -3, -2, -1, 0, 0, 0, 0, 1, 2]

        expect(BinarySearch.find_minimum_count(arr)).to be 2
      end

      it 'returns the count of the negative numbers when the positive count is greater' do
        arr = [-2, -1, 0, 0, 0, 0, 1, 2, 3, 4]

        expect(BinarySearch.find_minimum_count(arr)).to be 2
      end

      it 'returns 0 when the count is the same' do
        arr = [-2, -1, 0, 0, 0, 0, 1, 2]

        expect(BinarySearch.find_minimum_count(arr)).to be 0
      end
    end

    context 'no zeroes in the array' do
      it 'returns the count of the positive numbers when the negative count is greater' do
        arr = [-5, -4, -3, -2, -1, 1, 2]

        expect(BinarySearch.find_minimum_count(arr)).to be 2
      end

      it 'returns the count of the negative numbers when the positive count is greater' do
        arr = [-2, -1, 1, 2, 3, 4]

        expect(BinarySearch.find_minimum_count(arr)).to be 2
      end

      it 'returns 0 when the count is the same' do
        arr = [-2, -1, 1, 2]

        expect(BinarySearch.find_minimum_count(arr)).to be 0
      end
    end

    context 'other edge cases' do
      it 'returns 0 when the array is empty' do
        arr = []

        expect(BinarySearch.find_minimum_count(arr)).to be 0
      end

      it 'return 0 when the array only contains zeroes' do
        arr = [0, 0, 0, 0, 0]

        expect(BinarySearch.find_minimum_count(arr)).to be 0
      end
    end

    context 'only one of positive or negative' do
      it 'returns 0 when the array contains a single negative number' do
        arr = [-1]

        expect(BinarySearch.find_minimum_count(arr)).to be 0
      end

      it 'returns 0 when the array contains a single positive number' do
        arr = [1]

        expect(BinarySearch.find_minimum_count(arr)).to be 0
      end
    end
  end
end
