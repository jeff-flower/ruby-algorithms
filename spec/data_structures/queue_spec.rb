require './lib/data_structures/queue'

describe Queue do
  it 'the first item added to the stack is the first item to come out' do
    q = Queue.new

    expect(q.peek).to be_nil
    expect(q.dequeue).to be_nil

    q.enqueue(1)
    q.enqueue(2)
    q.enqueue(3)

    expect(q.peek).to be 1
    expect(q.dequeue).to be 1

    expect(q.peek).to be 2
    expect(q.dequeue).to be 2

    expect(q.peek).to be 3
    expect(q.dequeue).to be 3

    expect(q.peek).to be_nil
    expect(q.dequeue).to be_nil
  end
  
end