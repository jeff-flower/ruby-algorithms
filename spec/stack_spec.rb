require './lib/stack'

describe Stack do
  describe "#initialize" do
    it 'creates an empty stack' do
      s = Stack.new

      expect(s.peek).to be_nil
    end
  end
  describe "#push" do
    it "adds an item to the top of the stack" do
      s = Stack.new
      s.push(1)
      s.push(2)

      expect(s.peek).to be 2
    end
  end

  describe '#pop' do
    it "returns the most recent item" do
      s = Stack.new
      s.push(1)
      s.push(2)

      expect(s.pop).to eq 2
    end

    it "removes the most recent item" do
      s = Stack.new
      s.push(1)
      s.push(2)
      s.pop

      expect(s.peek).to eq 1
    end

    it 'returns nil if the stack is empty' do
      s = Stack.new

      expect(s.pop).to be_nil
    end
  end

  describe 'integration' do
    it "adds items to the top and removes items from top" do
      s = Stack.new
      s.push(1)
      s.push(2)
      s.push(3)

      result = []

      3.times do 
        result << s.pop
      end

      expect(result).to eq([3, 2, 1])
      expect(s.empty?).to be true
    end
  end
end