class Vertex
  attr_accessor :value, :color, :adj, :adjLabel

  def initialize(value)
    @value = value
    @adj = []
    @adjLabel = Hash.new
  end

  def addAdj(vertex, label = nil)
    @adj << vertex
    @adjLabel[vertex] = label
  end

  def delAdj(vertex)
    @adj.delete(vertex) if @adj.include?(vertex)
    @adjLabel.delete(vertex)
  end

  def id
    self.object_id
  end
end
