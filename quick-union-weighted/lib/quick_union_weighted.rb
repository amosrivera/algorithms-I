require 'pry'

class QuickUnionWeighted
  def initialize(connections)
    @points = (0..9).to_a
    @connections = connections
    @tree_size = @points
    @connections.map { |c| handle_unions(c) }
  end

  def handle_unions(connected_points)
    connected_points[1..-1].each_with_index do |point, index|
      union(connected_points[index],point)
    end
  end

  def union(id_a,id_b)
    root_a = root(id_a)
    root_b = root(id_b)

    if(@tree_size(root_a) > @tree_size(root_b))
      merge_tree(root_b, root_a)
    else
      merge_tree(root_a, root_b)
    end
  end

  def merge_tree(root_id, tree_id)
    @tree_size[root_id] += @tree_size[tree_id]
    @points[tree_id] = root_id
  end

  def root(id)
    id == get_parent(id) ? id : root(get_parent(id))
  end

  def get_parent(id)
    @points[id]
  end

  def connections
    @connections
  end

  def points
    @points
  end

  def connected?(point_a, point_b)
    root(point_a) == root(point_b)
  end
end
