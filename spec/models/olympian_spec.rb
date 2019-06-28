require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe "Relationships" do
    it {should belong_to :team}
    it {should belong_to :sport}
    it {should have_many :olympian_events}
    it {should have_many(:events).through(:olympian_events)}
    it {should have_many :medals}
  end

  describe 'Validations' do
    it {should define_enum_for(:sex).with_values(%i(male female))}
  end

  describe 'Class Methods' do

    before :each do
      @shooting = create(:sport, name: "Shooting")
      @olympian_1 = create(:olympian, name: "Mike", age: 27)
      @olympian_2 = create(:olympian, name: "Peter", age: 25)
   end

    describe 'all_with_medals' do
      before :each do
        @skeet = create(:event, name: "Skeet")
        @mike_gold = EventMedalist.create(event: @skeet, olympian: @olympian_1, medal: :gold)
      end

      it 'should return all olympians in the system with their medal count' do
        olympians = Olympian.all_with_medals
        
        expect(olympians.length).to eq(2)
        expect(olympians[0]).to eq(@olympian_1)
        expect(olympians[0].total_medals_won).to eq(1)
        expect(olympians[1]).to eq(@olympian_2)
        expect(olympians[1].total_medals_won).to eq(0)
      end
    end

    describe 'youngest' do
      it 'should return the youngest olympian in the system with their medal count' do
        olympians = Olympian.youngest
        
        expect(olympians.length).to eq(1)
        expect(olympians[0]).to eq(@olympian_2)
        expect(olympians[0].total_medals_won).to eq(0)
      end
    end
    
    describe 'oldest' do
      before :each do
        @skeet = create(:event, name: "Skeet")
        @mike_gold = EventMedalist.create(event: @skeet, olympian: @olympian_1, medal: :gold)
      end

      it 'should return the oldest olympian in the system with their medal count' do
        olympians = Olympian.oldest
        
        expect(olympians.length).to eq(1)
        expect(olympians[0]).to eq(@olympian_1)
        expect(olympians[0].total_medals_won).to eq(1)
      end
    end
  end

end
