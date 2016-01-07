require 'spec_helper'

module MasterMind

  describe Hole do

    describe '#initialize' do
      it 'can be initialized with a value of r' do
        hole = Hole.new('r')
        expect(hole.value).to eq('r')
      end
    end

    describe '#to_s' do
      it "should have a value of 'O' if the hole is empty" do
        hole = Hole.new(' ')
        expect(hole.to_s).to eq('O')
      end

      it "should have a value of self.value if value is present" do
        hole = Hole.new('r')
        expect(hole.to_s).to eq('r')
      end
    end

    describe '#empty?' do
      it 'should return true if the value is empty' do
        hole = Hole.new(' ')
        expect(hole.empty?).to eq(true)
      end

      it 'should return false if the value is present' do
        hole = Hole.new('r')
        expect(hole.empty?).to eq(false)
      end
    end

    describe '#mark_value(peg)' do
      it 'should change the value of the hole' do
        hole = Hole.new(' ')
        hole.mark_value('r')
        expect(hole.value).to eq('r')
      end
    end

  end

end