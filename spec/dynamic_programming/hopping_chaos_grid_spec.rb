require './lib/dynamic_programming/hopping_chaos_grid'

describe HoppingChaosGrid do
  describe 'bottom up' do
    test_cases = [
      {
        rows: 1,
        columns: 1,
        expected: 1
      },
      {
        rows: 2,
        columns: 2,
        expected: 2
      },
      {
        rows: 3,
        columns: 3,
        expected: 6
      },
      {
        rows: 3,
        columns: 5,
        expected: 15 
      },
      {
        rows: 6,
        columns: 6,
        expected: 252 
      },
    ]

    test_cases.each do |test_case|
      test_case => {rows:, columns:, expected:}
      it "#{rows}, #{columns}" do
        expect(HoppingChaosGrid.bottom_up(rows, columns)).to be expected
      end
    end
  end
end