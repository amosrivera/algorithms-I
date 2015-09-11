require 'pry'

class QuickUnion
  def initialize(connections)
    @points = (0..9).to_a
    @connections = connections

    @connections.map { |c| handle_unions(c) }
  end

  def handle_unions(connected_points)
    connected_points[1..-1].each_with_index do |point, index|
      union(connected_points[index],point)
    end
  end

  def union(id_a,id_b)
    @points[root(id_a)] = root(id_b)
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
