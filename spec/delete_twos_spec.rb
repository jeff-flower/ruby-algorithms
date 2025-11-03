require './lib/linked_list'
require './lib/delete_twos'

describe DeleteTwos do
  describe "#delete_twos" do
    it 'deletes 2 from the end of a list' do
      h = LinkedList.create_list([1, 2])

      i = DeleteTwos.delete_twos(h)
      result = LinkedList.print_list(i)

      expect(result).to eq("1")
    end

    it 'deletes 2 from the beginning of the list' do
      h = LinkedList.create_list([2, 3])

      i = DeleteTwos.delete_twos(h)
      result = LinkedList.print_list(i)

      expect(result).to eq("3")
    end

    it 'deletes 2 when it is the only item' do
      h = LinkedList.create_list([2])

      i = DeleteTwos.delete_twos(h)
      result = LinkedList.print_list(i)

      expect(result).to eq("")
    end

    it 'deletes 2 when it is in the middle of the list' do
      h = LinkedList.create_list([1, 2, 3])

      i = DeleteTwos.delete_twos(h)
      result = LinkedList.print_list(i)

      expect(result).to eq("1 -> 3")
    end

    it 'deletes consecutive 2s' do
      h = LinkedList.create_list([1, 2, 2, 3])

      i = DeleteTwos.delete_twos(h)
      result = LinkedList.print_list(i)

      expect(result).to eq("1 -> 3")
    end

    it 'deletes all 2s' do
      h = LinkedList.create_list([1, 2, 4, 2, 3])

      i = DeleteTwos.delete_twos(h)
      result = LinkedList.print_list(i)

      expect(result).to eq("1 -> 4 -> 3")

    end
  end
end

