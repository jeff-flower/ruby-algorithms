require './lib/linked_list/reverse_list'
require './lib/linked_list/linked_list'
require './lib/linked_list/node'

describe ReverseList do
  describe '#reverse_list' do
    it 'reverses a list' do
      initial_list_head = LinkedList.create_list([1, 2, 3, 4])

      reversed_list_head = ReverseList.reverse_list(initial_list_head)

      result = LinkedList.print_list(reversed_list_head)

      expect(result).to eq("4 -> 3 -> 2 -> 1")
    end

    it 'reverses a list of size one' do
      initial_list_head = LinkedList.create_list([1])

      reversed_list_head = ReverseList.reverse_list(initial_list_head)

      result = LinkedList.print_list(reversed_list_head)

      expect(result).to eq("1")
    end

    it 'reverses a list of size 0' do
      initial_list_head = nil 

      reversed_list_head = ReverseList.reverse_list(initial_list_head)

      result = LinkedList.print_list(reversed_list_head)

      expect(result).to eq("")
    end

    it 'reverses a list of size 2' do
      initial_list_head = LinkedList.create_list([1, 2])

      reversed_list_head = ReverseList.reverse_list(initial_list_head)

      result = LinkedList.print_list(reversed_list_head)

      expect(result).to eq("2 -> 1")
    end
  end
end