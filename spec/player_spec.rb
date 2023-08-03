require 'spec_helper'
require_relative '../lib/player'

describe Player do
  subject(:player_one) { described_class.new('me', 'x') }

    context 'when a new player is created' do
      it 'accepts and returns name of player' do
        expect(player_one.name).to eq('me')
      end

      it 'accepts and returns player piece' do
        expect(player_one.piece).to eq('x')
      end
    end

    context 'when player picks a square' do
      it 'accepts input from a player' do
        allow(player_one).to receive(:gets).and_return('1')
        expect(player_one).to receive(:gets).once
        player_one.pick_square
      end

      it 'accepts any input' do
        allow(player_one).to receive(:gets).and_return('%')
        expect(player_one).to receive(:gets).once
        player_one.pick_square
      end
    end
end
