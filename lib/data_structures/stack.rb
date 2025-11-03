require './lib/data_structures/node'

class Stack
  def initialize
    @top= nil
  end

  def peek
    @top&.value
  end

  def push(value)
     @top = Node.new(value, @top)
  end

  def pop
    return nil if @top.nil?

    removed_value = @top.value
    @top = @top.after

    removed_value
  end

  def empty?
    @top.nil?
  end
  
end