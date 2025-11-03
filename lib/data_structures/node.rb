class Node
  attr_reader :value
  attr_accessor :after

  def initialize(value, after = nil)
    @value = value
    @after = after
  end
end