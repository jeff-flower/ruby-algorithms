require './lib/linked_list/delete_every_second'
require './lib/linked_list/linked_list'

describe DeleteEverySecond do
  describe 'delete_every_second' do
    it 'deletes every second item in an odd length list' do
      head = LinkedList.create_list([1, 2, 3, 4, 5])

      DeleteEverySecond.delete_every_second(head)

      result = LinkedList.print_list(head)

      expect(result).to eq('1 -> 3 -> 5')
    end

    it 'deletes every second item in an even length list' do
      head = LinkedList.create_list([1, 2, 3, 4])

      DeleteEverySecond.delete_every_second(head)

      result = LinkedList.print_list(head)

      expect(result).to eq('1 -> 3')
    end

    it 'does nothing to a list of length 1' do
      head = LinkedList.create_list([1])

      DeleteEverySecond.delete_every_second(head)

      result = LinkedList.print_list(head)

      expect(result).to eq('1')
    end

    it 'does nothing to a list of length 0' do
      head = nil

      DeleteEverySecond.delete_every_second(head)

      result = LinkedList.print_list(head)

      expect(result).to eq('')
    end
  end
end