require 'spec_helper'
require 'quick_union'

qf = QuickUnion.new([
  [0,5,6],
  [1,2,7],
  [3,4,8,9]
])

describe 'quick find' do
  context 'when initialized' do
    it 'has a points array' do
      expect(qf.points).not_to be_nil
    end

    it 'has a connections array' do
      expect(qf.connections).not_to be_nil
    end

    it 'connects the points' do
      expect(qf.root(1)).to eq(7)
      expect(qf.root(2)).to eq(7)
      expect(qf.root(7)).to eq(7)
    end

    it 'can tell if two points are connected' do
      expect(qf.connected?(5,6)).to be(true)
      expect(qf.connected?(1,3)).to be(false)
    end
  end
end
