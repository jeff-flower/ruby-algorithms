require './lib/start_end'

describe StartEnd do
  describe "#find_target_sum" do
    it "returns the pair when the target is present" do
      sorted = [1, 3, 5, 7, 9, 11]

      target = 14

      expect(StartEnd.find_target_sum(sorted, target)).to eq([3, 11])
    end

    it "returns nil when the target is not present" do
      sorted = [1, 3, 5, 7, 9, 11]

      target = 15 

      expect(StartEnd.find_target_sum(sorted, target)).to eq(nil)

    end
  end

  describe "#reverse_consonants" do

    test_cases = [
      {str: "", expected: ""},
      {str: "a", expected: "a"},
      {str: "b", expected: "b"},
      {str: "ab", expected: "ab"},
      {str: "ba", expected: "ba"},
      {str: "bac", expected: "cab"},
      {str: "HELLO", expected: "LELHO"},
      {str: "leetcode", expected: "deectole"},
      {str: "example", expected: "elapmxe"},
      {str: "Consonants", expected: "sotnonasnC"},
      {str: "ca!d", expected: "da!c"},
      {str: "a quick", expected: "a kuicq"},
      {str: "123", expected: "123"},
      {str: "a b c", expected: "a c b"},
    ]

    test_cases.each do | test_case |
      it "#{test_case[:str]}" do
        result = StartEnd.reverse_consonants test_case[:str]

        expect(result).to eq test_case[:expected]
      end
    end
  end
end