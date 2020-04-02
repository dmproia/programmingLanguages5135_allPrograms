#!/usr/bin/ruby
require 'pqueue'

class Graph
  attr_reader :edges
  INFINITY = 1 << 32
  def initialize(size)
    @edges = Array.new(size) {Array.new(size)}
  end

  def connect(src, dst, length = 1)
    @edges[src][dst] = length
  end

  def connect_mutually(vertex1, vertex2, length = 1)
    connect vertex1, vertex2, length
    connect vertex2, vertex1, length
  end

  def neighbors(vertex)
    @edges[vertex]
  end

  def length_between(src, dst)
    @edges[src][dst]
  end
  
   def dijkstra(source)
    visited  = Array.new(@edges[0].size, false)
    shortest = Array.new(@edges[0].size, INFINITY)
    previous = Array.new(@edges.size, nil)
    pq = PQueue.new(){|x,y| shortest[x] < shortest[y]}

    pq.push(source)
    visited[source] = true
    shortest[source] = 0

    while pq.size != 0
      v = pq.pop
      visited[v] = true
      if @edges[v]
       @edges[v].each_index do |w|
          if @edges[v][w]
           if !visited[w] and shortest[w] > shortest[v] + @edges[v][w]
             shortest[w] = shortest[v] + @edges[v][w]
             previous[w] = v
             pq.push(w)
           end
         # TODO: break up the stairway to 'end-heaven'
         end 
        end
      end
    end
    return [shortest, previous]
  end
end

graph = Graph.new(6)
graph.connect_mutually 0, 2, 12
graph.connect_mutually 0, 5, 4
graph.connect_mutually 1, 2, 7
graph.connect_mutually 1, 3, 9
graph.connect_mutually 1, 5, 14
graph.connect_mutually 2, 3, 10
graph.connect_mutually 2, 4, 15
graph.connect_mutually 3, 0, 11
graph.connect_mutually 3, 5, 2
graph.connect_mutually 4, 5, 6

p graph.length_between(2, 1)
p graph.neighbors(1)

p graph
p graph.dijkstra(1)




