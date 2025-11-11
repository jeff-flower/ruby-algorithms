require './lib/dynamic_programming/hopping_chaos_cats'

describe HoppingChaosCats do
  test_cases = [
    {
      grid: [
        ["", "C"],
        ["", ""]
      ],
      expected: 1
    },
    {
      grid: [
        ["", "C"]
      ],
      expected: 0
    },
    {
      grid: [
        ["", ""],
        ["", "C"]
      ],
      expected: 0
    },
    {
      grid: [
        ["", "", ""],
        ["", "C", ""],
        ["", "", ""]
      ],
      expected: 2
    },
    {
      grid: [
        ["", "", "", "", "C"],
        ["", "C", "", "", ""],
        ["", "", "", "C", ""]
      ],
      expected: 2
    },
    {
      grid: [
        ["", "", "", "", "C", ""],
        ["", "C", "", "", "", ""],
        ["", "", "", "", "", ""],
        ["", "", "", "C", "", ""],
        ["", "C", "", "", "", ""],
        ["", "", "", "", "", ""]
      ],
      expected: 44 
    },
  ]

  describe '#bottom_up' do
    test_cases.each_with_index do |test_case, index|
      test_case => {grid:, expected:}

      it "case #{index}" do
        expect(HoppingChaosCats.bottom_up(grid)).to eq expected
      end
    end
  end

  describe '#top_down' do
    test_cases.each_with_index do |test_case, index|
      test_case => {grid:, expected:}

      it "case #{index}" do
        expect(HoppingChaosCats.top_down(grid)).to eq expected
      end
    end
  end
end