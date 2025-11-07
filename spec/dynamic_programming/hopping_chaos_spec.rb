require './lib/dynamic_programming/hopping_chaos'
describe HoppingChaos do
  it "top down solution" do
    distinct_paths = HoppingChaos.distinct_top_down(5)
    expect(distinct_paths).to be 8
  end

  it "bottom up solution" do
    distinct_paths = HoppingChaos.distinct_bottom_up(5)
    expect(distinct_paths).to be 8
  end
end