require './lib/quicksort/quicksort'

describe Quicksort do
  test_cases = [
    {
      arr: [7, 3, 9, 8, 5, 1],
      expected: [1, 3, 5, 7, 8, 9]

    },
    {
      arr: [],
      expected: []
    },
    {
      arr: [5],
      expected: [5]
    },
    {
      arr: [5, 3],
      expected: [3, 5]
    }
  ]

  test_cases.each do |test_case|
    it 'sorts #{arr}' do
      Quicksort.sort(test_case[:arr])

      expect(test_case[:arr]).to eq test_case[:expected]
    end
  end
end