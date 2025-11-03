require './lib/selection_sort'

describe SelectionSort do
  describe '#sort' do
    it 'sorts an integer array in ascending order' do
      array = [4, 3, 78, 2, 0, 2]
      expected = [0, 2, 2, 3, 4, 78]

      described_class.sort(array) { |a, b| a < b }
      expect(array).to eq(expected)
    end

    it 'sorts integers in descending order' do
      array = [4, 3, 78, 2, 0, 2]
      expected = [78, 4, 3, 2, 2, 0]

      described_class.sort(array) { |a, b| a > b }
      expect(array).to eq(expected)
    end
  end
end
