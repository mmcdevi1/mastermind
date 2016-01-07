require 'spec_helper'

module MasterMind

  describe BoardRow do
    let(:board_row) { BoardRow.new }

    describe '#initialize' do
      it 'initializes a @hole array' do
        expect(board_row.hole).to be_instance_of(Array)
      end

      it 'initializes a @feedback_hole array' do
        expect(board_row.feedback_hole).to be_instance_of(Array)
      end

      it 'instantiates a hole from BoardHole class' do
        expect(board_row.hole[0]).to be_instance_of(BoardHole)
      end

      it 'instantiates a hole from FeedbackHole class' do
        expect(board_row.feedback_hole[0]).to be_instance_of(FeedbackHole)
      end

      it 'creates an row of 4 holes' do
        expect(board_row.hole.length).to eq(4)
      end
    end

    describe '#render_holes' do
      it 'renders a row of holes and feedback holes' do
        expect(board_row.render_holes).to eq("| O | O | O | O | _ | _ | _ | _ |")
      end
    end

    describe '#empty_holes' do
      it 'selects empty holes' do
        expect(board_row.empty_holes).to eq([' ', ' ', ' ', ' '])
      end
    end

  end

end