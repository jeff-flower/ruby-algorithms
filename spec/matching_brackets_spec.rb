require './lib/matching_brackets'

describe MatchingBrackets do

  cases = [
    {
      name: 'returns false for an empty string',
      input: "",
      expected: false
    },
    {
      name: 'returns false for open paren',
      input: "(",
      expected: false
    },
    {
      name: 'returns false for an open bracket',
      input: "[",
      expected: false
    },
    {
      name: 'returns false for an open squiggly',
      input: "{",
      expected: false
    },
    {
      name: 'returns false for unmatched parens',
      input: ")(",
      expected: false
    },
    {
      name: 'returns false for unmatched brackets',
      input: "][",
      expected: false
    },
    {
      name: 'returns false for unmatched squigglies',
      input: "}{",
      expected: false
    },
    {
      name: 'returns false for deeply nested open brackets',
      input: "([[][)",
      expected: false
    },
    {
      name: 'returns false for deeply nested open parens',
      input: "([([](])",
      expected: false
    },
    {
      name: 'returns false for deeply nested open squigglies',
      input: "([{[]{])",
      expected: false
    },
    {
      name: 'returns false for deeply nested closed parens',
      input: "([)[])])",
      expected: false
    },
    {
      name: 'returns false for deeply nested closed brackets',
      input: "([][]]])",
      expected: false
    },
    {
      name: 'returns false for deeply nested closed squigglies',
      input: "([][]}})",
      expected: false
    },
    {
      name: 'returns false for the right number of pairs with the wrong nesting',
      input: "([)]",
      expected: false
    },
    {
      name: 'returns true for open and closed parens',
      input: "()",
      expected: true 
    },
    {
      name: 'returns true for open and closed brackets',
      input: "[]",
      expected: true 
    },
    {
      name: 'returns true for open and closed squigglies',
      input: "{}",
      expected: true 
    },
    {
      name: 'returns true for nested pairs',
      input: "({[]})",
      expected: true 
    }
  ]

  cases.each do |c|
    it c[:name] do
      expect(MatchingBrackets.is_match?(c[:input])).to be c[:expected] 
    end 
  end
end