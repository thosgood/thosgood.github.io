# frozen_string_literal: true

module Nanoc
  module Core
    # Represents a directed graph. It is used by the dependency tracker for
    # storing and querying dependencies between items.
    #
    # @example Creating and using a directed graph
    #
    #   # Create a graph with three vertices
    #   graph = Nanoc::Core::DirectedGraph.new(%w( a b c d e f g ))
    #
    #   # Add edges
    #   graph.add_edge('a', 'b')
    #   graph.add_edge('b', 'c')
    #   graph.add_edge('b', 'f')
    #   graph.add_edge('b', 'g')
    #   graph.add_edge('c', 'd')
    #   graph.add_edge('d', 'e')
    #
    #   # Get (direct) predecessors
    #   graph.direct_predecessors_of('b').sort
    #     # => %w( a )
    #   graph.predecessors_of('e').sort
    #     # => %w( a b c d )
    #
    #   # Modify edges
    #   graph.delete_edges_to('c')
    #
    #   # Get (direct) predecessors again
    #   graph.direct_predecessors_of('e').sort
    #     # => %w( d )
    #   graph.predecessors_of('e').sort
    #     # => %w( c d )
    class DirectedGraph
      # @group Creating a graph

      # Creates a new directed graph with the given vertices.
      def initialize(vertices)
        @vertices = {}
        @next_vertex_idx = 0
        vertices.each do |v|
          @vertices[v] = @next_vertex_idx.tap { @next_vertex_idx += 1 }
        end

        @to_graph = {}

        @edge_props = {}

        invalidate_caches
      end

      def inspect
        s = []

        @vertices.each_pair do |v2, _|
          direct_predecessors_of(v2).each do |v1|
            s << [v1.inspect + ' -> ' + v2.inspect + ' props=' + @edge_props[[v1, v2]].inspect]
          end
        end

        self.class.to_s + '(' + s.join(', ') + ')'
      end

      # @group Modifying the graph

      # Adds an edge from the first vertex to the second vertex.
      #
      # @param from Vertex where the edge should start
      #
      # @param to   Vertex where the edge should end
      #
      # @return [void]
      def add_edge(from, to, props: nil)
        add_vertex(from)
        add_vertex(to)

        @to_graph[to] ||= Set.new
        @to_graph[to] << from

        if props
          @edge_props[[from, to]] = props
        end

        invalidate_caches
      end

      # Adds the given vertex to the graph.
      #
      # @param vertex The vertex to add to the graph
      #
      # @return [void]
      def add_vertex(vertex)
        return if @vertices.key?(vertex)

        @vertices[vertex] = @next_vertex_idx.tap { @next_vertex_idx += 1 }
      end

      # Deletes all edges going to the given vertex.
      #
      # @param to Vertex to which all edges should be removed
      #
      # @return [void]
      def delete_edges_to(to)
        return if @to_graph[to].nil?

        @to_graph[to].each do |from|
          @edge_props.delete([from, to])
        end
        @to_graph.delete(to)

        invalidate_caches
      end

      # @group Querying the graph

      # Returns the direct predecessors of the given vertex, i.e. the vertices
      # x where there is an edge from x to the given vertex y.
      #
      # @param to The vertex of which the predecessors should be calculated
      #
      # @return [Array] Direct predecessors of the given vertex
      def direct_predecessors_of(to)
        @to_graph.fetch(to, Set.new)
      end

      # Returns the predecessors of the given vertex, i.e. the vertices x for
      # which there is a path from x to the given vertex y.
      #
      # @param to The vertex of which the predecessors should be calculated
      #
      # @return [Array] Predecessors of the given vertex
      def predecessors_of(to)
        @predecessors[to] ||= recursively_find_vertices(to, :direct_predecessors_of)
      end

      def props_for(from, to)
        @edge_props[[from, to]]
      end

      # @return [Array] The list of all vertices in this graph.
      def vertices
        @vertices.keys.sort_by { |v| @vertices[v] }
      end

      # Returns an array of tuples representing the edges. The result of this
      # method may take a while to compute and should be cached if possible.
      #
      # @return [Array] The list of all edges in this graph.
      def edges
        result = []
        @vertices.each_pair do |v2, i2|
          direct_predecessors_of(v2).map { |v1| [@vertices[v1], v1] }.each do |i1, v1|
            result << [i1, i2, @edge_props[[v1, v2]]]
          end
        end
        result
      end

      private

      # Invalidates cached data. This method should be called when the internal
      # graph representation is changed.
      def invalidate_caches
        @predecessors = {}
      end

      # Recursively finds vertices, starting at the vertex start, using the
      # given method, which should be a symbol to a method that takes a vertex
      # and returns related vertices (e.g. predecessors, successors).
      def recursively_find_vertices(start, method)
        all_vertices = Set.new

        processed_vertices   = Set.new
        unprocessed_vertices = [start]

        until unprocessed_vertices.empty?
          # Get next unprocessed vertex
          vertex = unprocessed_vertices.pop
          next if processed_vertices.include?(vertex)

          processed_vertices << vertex

          # Add predecessors of this vertex
          send(method, vertex).each do |v|
            all_vertices << v unless all_vertices.include?(v)
            unprocessed_vertices << v
          end
        end

        all_vertices
      end
    end
  end
end
