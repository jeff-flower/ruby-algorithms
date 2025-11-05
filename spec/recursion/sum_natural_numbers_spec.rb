require './lib/recursion/sum_natural_numbers'

describe SumNaturalNumbers do
  test_cases = [
    {
      input: 0,
      expected: 0 
    },
    {
      input: 1,
      expected: 1 
    },
    {
      input: 5,
      expected: 15
    },
    {
      input: 10,
      expected: 55
    },
    {
      input: 20,
      expected: 210 
    }
  ]

  test_cases.each do |test_case|
    it "sums the first #{test_case[:input]} numbers" do
      expect(SumNaturalNumbers.sum(test_case[:input])).to be test_case[:expected]
    end
  end
end