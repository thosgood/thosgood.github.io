# frozen_string_literal: true

module Nanoc
  module Core
    # @api private
    class DependencyStore < ::Nanoc::Core::Store
      include Nanoc::Core::ContractsSupport

      C_ATTR = C::Or[C::IterOf[Symbol], C::Bool]
      C_RAW_CONTENT = C::Or[C::IterOf[C::Or[String, Regexp]], C::Bool]
      C_KEYWORD_PROPS = C::KeywordArgs[raw_content: C::Optional[C_RAW_CONTENT], attributes: C::Optional[C_ATTR], compiled_content: C::Optional[C::Bool], path: C::Optional[C::Bool]]
      C_OBJ_SRC = Nanoc::Core::Item
      C_OBJ_DST = C::Or[Nanoc::Core::Item, Nanoc::Core::Layout, Nanoc::Core::Configuration, Nanoc::Core::IdentifiableCollection]

      attr_reader :items
      attr_reader :layouts

      contract Nanoc::Core::ItemCollection, Nanoc::Core::LayoutCollection, Nanoc::Core::Configuration => C::Any
      def initialize(items, layouts, config)
        super(Nanoc::Core::Store.tmp_path_for(config: config, store_name: 'dependencies'), 5)

        @items = items
        @layouts = layouts

        @refs2objs = {}
        items.each   { |o| add_vertex_for(o) }
        layouts.each { |o| add_vertex_for(o) }
        add_vertex_for(config)
        add_vertex_for(items)
        add_vertex_for(layouts)

        @new_objects = []
        @graph = Nanoc::Core::DirectedGraph.new([nil] + objs2refs(@items) + objs2refs(@layouts))
      end

      contract C_OBJ_SRC => C::ArrayOf[Nanoc::Core::Dependency]
      def dependencies_causing_outdatedness_of(object)
        objects_causing_outdatedness_of(object).map do |other_object|
          props = props_for(other_object, object)

          Nanoc::Core::Dependency.new(
            other_object,
            object,
            Nanoc::Core::DependencyProps.new(
              raw_content: props.fetch(:raw_content, false),
              attributes: props.fetch(:attributes, false),
              compiled_content: props.fetch(:compiled_content, false),
              path: props.fetch(:path, false),
            ),
          )
        end
      end

      def items=(items)
        @items = items
        items.each { |o| @refs2objs[obj2ref(o)] = o }
        add_vertex_for(items)
      end

      def layouts=(layouts)
        @layouts = layouts
        layouts.each { |o| @refs2objs[obj2ref(o)] = o }
        add_vertex_for(layouts)
      end

      def new_items
        @new_objects.select { |o| o.is_a?(Nanoc::Core::Item) }
      end

      def new_layouts
        @new_objects.select { |o| o.is_a?(Nanoc::Core::Layout) }
      end

      # Returns the direct dependencies for the given object.
      #
      # The direct dependencies of the given object include the items and
      # layouts that, when outdated will cause the given object to be marked as
      # outdated. Indirect dependencies will not be returned (e.g. if A depends
      # on B which depends on C, then the direct dependencies of A do not
      # include C).
      #
      # The direct predecessors can include nil, which indicates an item that is
      # no longer present in the site.
      #
      # @param [Nanoc::Core::Item, Nanoc::Core::Layout] object The object for
      #   which to fetch the direct predecessors
      #
      # @return [Array<Nanoc::Core::Item, Nanoc::Core::Layout, nil>] The direct
      # predecessors of
      #   the given object
      def objects_causing_outdatedness_of(object)
        refs2objs(@graph.direct_predecessors_of(obj2ref(object)))
      end

      contract C::Maybe[C_OBJ_SRC], C::Maybe[C_OBJ_DST], C_KEYWORD_PROPS => C::Any
      # Records a dependency from `src` to `dst` in the dependency graph. When
      # `dst` is oudated, `src` will also become outdated.
      #
      # @param [Nanoc::Core::Item, Nanoc::Core::Layout] src The source of the dependency,
      #   i.e. the object that will become outdated if dst is outdated
      #
      # @param [Nanoc::Core::Item, Nanoc::Core::Layout] dst The destination of the
      #   dependency, i.e. the object that will cause the source to become
      #   outdated if the destination is outdated
      #
      # @return [void]
      def record_dependency(src, dst, raw_content: false, attributes: false, compiled_content: false, path: false)
        return if src == dst

        add_vertex_for(src)
        add_vertex_for(dst)

        src_ref = obj2ref(src)
        dst_ref = obj2ref(dst)

        existing_props = Nanoc::Core::DependencyProps.new(**(@graph.props_for(dst_ref, src_ref) || {}))
        new_props = Nanoc::Core::DependencyProps.new(raw_content: raw_content, attributes: attributes, compiled_content: compiled_content, path: path)
        props = existing_props.merge(new_props)

        @graph.add_edge(dst_ref, src_ref, props: props.to_h)
      end

      def add_vertex_for(obj)
        @refs2objs[obj2ref(obj)] = obj
      end

      # Empties the list of dependencies for the given object. This is necessary
      # before recompiling the given object, because otherwise old dependencies
      # will stick around and new dependencies will appear twice. This function
      # removes all incoming edges for the given vertex.
      #
      # @param [Nanoc::Core::Item, Nanoc::Core::Layout] object The object for which to
      #   forget all dependencies
      #
      # @return [void]
      def forget_dependencies_for(object)
        @graph.delete_edges_to(obj2ref(object))
      end

      protected

      def obj2ref(obj)
        obj&.reference
      end

      def ref2obj(reference)
        if reference
          @refs2objs[reference]
        else
          nil
        end
      end

      def objs2refs(objs)
        objs.map { |o| obj2ref(o) }
      end

      def refs2objs(refs)
        refs.map { |r| ref2obj(r) }
      end

      def props_for(from, to)
        props = @graph.props_for(obj2ref(from), obj2ref(to)) || {}

        if props.values.any? { |v| v }
          props
        else
          { raw_content: true, attributes: true, compiled_content: true, path: true }
        end
      end

      def data
        {
          edges: @graph.edges,
          vertices: @graph.vertices,
        }
      end

      def data=(new_data)
        objects = Set.new(@items.to_a + @layouts.to_a)
        refs = objs2refs(objects)

        # Create new graph
        @graph = Nanoc::Core::DirectedGraph.new([nil] + refs)

        # Load vertices
        previous_objects = refs2objs(new_data[:vertices])
        previous_refs = objs2refs(previous_objects)

        # Load edges
        new_data[:edges].each do |edge|
          from_index, to_index, props = *edge
          from = from_index && previous_refs[from_index]
          to   = to_index && previous_refs[to_index]
          @graph.add_edge(from, to, props: props)
        end

        # Record dependency from all items on new items
        @new_objects = objects - previous_objects
      end
    end
  end
end
