require './lib/recursion/palindrome'
describe Palindrome do
  describe 'edge cases' do
    it 'returns true for an empty string' do
      str = ''

      expect(Palindrome.palindrome?(str)).to be true
    end

    it 'returns true for a string of length 1' do
      str = 'a'

      expect(Palindrome.palindrome?(str)).to be true
    end
  end 

  describe 'cases' do
    test_cases = [
      {
        str: 'aa' ,
        expected: true
      },
      {
        str: 'ab',
        expected: false
      },
      {
        str: 'aba',
        expected: true 
      },
      {
        str: 'abc',
        expected: false
      },
      {
        str: 'madam',
        expected: true 
      },
      {
        str: 'abcdefgfedcba',
        expected: true 
      },
      {
        str: 'abcdefgffdcba',
        expected: false 
      },
    ]

    test_cases.each do |test_case|
      it "#{test_case[:str]}" do
        expect(Palindrome.palindrome?(test_case[:str])).to be test_case[:expected]
      end
    end
  end

end