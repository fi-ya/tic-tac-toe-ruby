require 'player'

describe Player do
  subject(:player) { described_class.new('X', 'Computer') }

  context 'computer player marker and name' do
    it 'should have X marker for computerplayer' do
      expect(player.marker).to eq('X')
    end

    it 'should have correct name for computer player' do
      expect(player.name).to eq('Computer')
    end
  end
end
