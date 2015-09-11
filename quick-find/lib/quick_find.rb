require 'pry'

class QuickFind
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
    @points.map! { |p| p == id_a ? id_b : p }
  end

  def connections
    @connections
  end

  def points
    @points
  end

  def connected?(point_a, point_b)
    @points[point_a] == @points[point_b]
  end
end
