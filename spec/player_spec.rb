require 'player'

describe Player do

  subject(:player) { described_class('X', 'Computer') }

    context 'player marker' do
        it 'should have X marker for computer' do
            p "Player: #{player} ?????????"
            expect(player.marker).to eq('X')
        end

        it 'should have X marker for computer' do
            p "Player: #{player} ?????????"
            expect(player.name).to eq('Computer')
        end
    end
end