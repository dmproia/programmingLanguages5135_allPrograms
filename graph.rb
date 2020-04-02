require './vertex.rb'

class Graph
  attr_accessor :vertices

  def initialize(*vertices)
    @vertices = vertices
  end

  def addEdge(srcVertex, dstVertex, label = nil)
    srcVertex.addAdj(dstVertex, label)
  end

  def delEdge(srcVertex, dstVertex)
    srcVertex.delAdj(dstVertex)
  end

  def delVertex(vertex)
    @vertices.delete(vertex) if @vertices.include?(vertex)
  end

  def display(dir= "->")
    File.open("graph.dot", "w") do |f|
      f.print "di" if dir == "->"
      f.print "graph"
      f.puts " {"

      @vertices.each do |vertex|
        f.puts"  #{vertex.id} [label=\"#{vertex.value}\"];"
      end

      f.puts

      @vertices.each do |vertex|
        vertex.adj.each do |adj|
          f.print "  #{vertex.id} #{dir} #{adj.id}"
          unless vertex.adjLabel[adj].nil?
            f.print " [label=\"#{vertex.adjLabel[adj]}\"]"
          end
          f.puts ";"
        end
      end


      f.puts "}"
    end

    %x[dot -Tpng graph.dot -o "graph.png"]
    # Commented out for cross-platformness
    #%x[rm graph.dot]
    #%x[open graph.png]
    puts "Image opened and graph saved to graph.png"
  end
end
