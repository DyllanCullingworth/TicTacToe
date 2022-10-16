require 'tic_tac_toe'
require 'player'

describe TicTacToe do
  let(:player_1) { Player.new(1, name: 'Dyllan', piece: 'D') }
  let(:player_2) { Player.new(2, name: 'John', piece: 'J') }

  let(:subject) { described_class.new(player_1, player_2) }

  context 'player 1 is the winner' do
    before do
      allow(subject).to receive(:prompt).and_return('1','2','3','4','5','6','7')
      allow(subject).to receive(:play_again_prompt).and_return('n')
      subject.play
    end
    
    it 'Fills in the board positions correctly' do
      expect(subject.board_positions).to eq(['D','J','D','J','D','J','D','8','9'])
    end

    it 'sets player 1 as the winner' do
      expect(subject.winner).to eq(player_1)
    end

    context 'player decides to play again' do
      before do
        allow_any_instance_of(TicTacToe).to receive(:play_again_prompt).and_return('y')
      end

      it 'prompts to play again' do
        message = "Would you like to play again? [Y/N]"
        expect(subject).to have_received(:play_again_prompt)
      end
      
      it 'does not reset the player objects' do
        
      end

      it 'creates a new instance of the game' do

      end
    end
  end
  

  
    
end