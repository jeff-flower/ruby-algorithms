require './lib/anchor_runner'

describe AnchorRunner do
  describe "#partition_ones" do
    it "moves all 1s in an array to the end" do
      arr = [1, 2, 1, 4, 8]
      expected = [2, 4, 8, 1, 1]

      AnchorRunner.partition_ones(arr)

      expect(arr).to eq(expected)
    end

    it "handles empty arrays" do
      arr = []
      expected = []

      AnchorRunner.partition_ones(arr)

      expect(arr).to eq(expected)
    end

    it "handles arrays with no 1s" do
      arr = [2, 3, 4]
      expected = [2, 3, 4]

      AnchorRunner.partition_ones(arr)

      expect(arr).to eq(expected)
    end

    it "handles arrays with all 1s" do
      arr = [1, 1, 1]
      expected = [1, 1, 1]

      AnchorRunner.partition_ones(arr)

      expect(arr).to eq(expected)
    end

    it "handles an array with a single element" do
      arr = [1]
      expected = [1]

      AnchorRunner.partition_ones(arr)

      expect(arr).to eq(expected)
    end

    it "handles an array with consecutive 1s" do
      arr = [1, 1, 2, 3, 1, 4]
      expected = [2, 3, 4, 1, 1, 1]

      AnchorRunner.partition_ones(arr)

      expect(arr).to eq(expected)
    end
  end

  describe "#compress_distinct!" do
    it "does nothing to an empty array" do
      arr = []

      result = AnchorRunner.compress_distinct!(arr)

      expect(arr).to eq([])
      expect(result).to eq(0)
    end

    it "does nothing to a one element array" do
      arr = [1]

      result = AnchorRunner.compress_distinct!(arr)

      expect(arr).to eq([1])
      expect(result).to eq(1)
    end

    it "does nothing to a two element array" do
      arr = [1, 1]

      result = AnchorRunner.compress_distinct!(arr)

      expect(arr).to eq([1, 1])
      expect(result).to eq(1)
    end

    it "case 1" do
      arr = [1, 1, 2]

      result = AnchorRunner.compress_distinct!(arr)

      expect(arr).to start_with(1, 2)
      expect(result).to eq(2)
    end


    it "case 2" do
      arr = [1, 1, 2, 2, 2, 3, 4, 4, 5]

      result = AnchorRunner.compress_distinct!(arr)

      expect(arr).to start_with(1, 2, 3, 4, 5)
      expect(result).to eq (5)
    end

    it "case 3" do
      arr = [-5, -3, -3, -1, 0, 0, 0, 1] 

      result = AnchorRunner.compress_distinct!(arr)

      expect(arr).to start_with(-5, -3, -1, 0, 1)
      expect(result).to eq(5)
    end

    it "case 4" do
      arr = [1, 1, 2, 2, 2, 3, 4, 4, 5] 

      result = AnchorRunner.compress_distinct!(arr)

      expect(arr).to start_with(1, 2, 3, 4, 5)
      expect(result).to eq(5)
    end
  end
end