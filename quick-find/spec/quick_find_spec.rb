require 'spec_helper'
require 'quick_find'

qf = QuickFind.new([
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
      expect(qf.points[0]).to eq(6)
      expect(qf.points[5]).to eq(6)
      expect(qf.points[6]).to eq(6)
    end

    it 'can tell if two points are connected' do
      expect(qf.connected?(5,6)).to be(true)
      expect(qf.connected?(1,3)).to be(false)
    end
  end
end
