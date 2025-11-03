require './lib/queue'
require './lib/node'

class Queue
  def initialize
    @front = nil
    @back = nil
  end

  def enqueue(value)
    n = Node.new(value)

    @back.after = n unless @back.nil?
    @front = n if @front.nil?
    @back = n
  end

  def dequeue
    return nil if @front.nil?

    front_value = @front.value
    @front = @front.after
    @back = nil if @front.nil?

    front_value
  end

  def peek
    @front&.value
  end
end