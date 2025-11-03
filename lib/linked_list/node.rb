class Node
  attr_accessor :value, :after

  def initialize(value, after = nil)
    @value = value 
    @after = after
  end
end