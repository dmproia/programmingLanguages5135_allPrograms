#!/usr/bin/ruby1.9.1 -
# -*- coding: utf-8 -*-
# David Proia
# Assignment 2

class Edge
  attr_accessor :src, :dst, :length
  
  def initialize(src, dst, length = 1)
    @src = src
    @dst = dst
    @length = length
  end
end

class Graph < Array
  attr_reader :edgesArray
  
  def initialize
    @edgesArray = []
  end
  
  def connect(src, dst, length = 1)
    unless self.include?(src)
      raise ArgumentException, "Vertex Doesn't Exist: #{src}"
    end
    unless self.include?(dst)
      raise ArgumentException, "Vertext Doesn't Exist: #{dst}"
    end
    @edgesArray.push Edge.new(src, dst, length)
  end
  
  def connect_mutually(vertex1, vertex2, length = 1)
    self.connect vertex1, vertex2, length
    self.connect vertex2, vertex1, length
  end

  def neighbors(vertex)
    neighbors = []
    @edgesArray.each do |edge|
      neighbors.push edge.dst if edge.src == vertex
    end
    return neighbors.uniq
  end

  def length_between(src, dst)
    @edgesArray.each do |edge|
      return edge.length if edge.src == src and edge.dst == dst
    end
    nil
  end

  def fullArray(src, dst = nil)
    distances = {}
    previouses = {}
    self.each do |vertex|
      distances[vertex] = nil # Infinity
      previouses[vertex] = nil
    end
    distances[src] = 0
    vertices = self.clone
    until vertices.empty?
      closest_vertex = vertices.inject do |a, b|
        next b unless distances[a]
        next a unless distances[b]
        next a if distances[a] < distances[b]
        b
      end
      break unless distances[closest_vertex] # Infinity
      if dst and closest_vertex == dst
        return distances[dst]
      end
      neighbors = vertices.neighbors(closest_vertex)
      neighbors.each do |vertex|
        alt = distances[closest_vertex] + vertices.length_between(closest_vertex, vertex)
        if distances[vertex].nil? or alt < distances[vertex]
          distances[vertex] = alt
          previouses[vertices] = closest_vertex
          
        end
      end
      vertices.delete closest_vertex
    end
    if dst
      return nil
    else
      return distances
    end
  end
end

graph = Graph.new
(1..6).each {|node| graph.push node }
graph.connect_mutually 1, 2, 5
graph.connect_mutually 1, 3, 9
graph.connect_mutually 1, 6, 14
graph.connect_mutually 2, 3, 10
graph.connect_mutually 2, 4, 15
graph.connect_mutually 3, 4, 11
graph.connect_mutually 3, 6, 2
graph.connect_mutually 4, 5, 6
graph.connect_mutually 5, 6, 9

p ('Graph')
p graph 

p (' - Length between [2,1] -')
p graph.length_between(2, 1)

p (' - Edge of Vertex of [1] -')
p graph.neighbors(1)
p (' - Edge of Vertex of [2] -')
p graph.neighbors(2)
p (' - Edge of Vertex of [3] -')
p graph.neighbors(3)
p (' - Edge of Vertex of [4] -')
p graph.neighbors(4)
p (' - Edge of Vertex of [5] -')
p graph.neighbors(5)
p (' - Edge of Vertex of [6] -')
p graph.neighbors(6)

p (' - Full Array of [1,5] -')
p graph.fullArray(1, 5)

