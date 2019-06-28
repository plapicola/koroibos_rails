require 'rails_helper'

RSpec.describe 'Olympian API', type: :request do
   context 'as a visitor' do
      describe 'Olympian index' do
         before :each do
            @shooting = create(:sport, name: "Shooting")
            @olympian_1 = create(:olympian, name: "Mike", age: 27)
            @olympian_2 = create(:olympian, name: "Peter", age: 25)
            @skeet = create(:event, name: "Skeet")
            @mike_gold = EventMedalist.create(event: @skeet, olympian: @olympian_1, medal: :gold)
         end

         it 'returns all olympians in the system and their count of medals' do
            get '/api/v1/olympians'

            olympians = JSON.parse(response.body, symbolize_names: true)[:olympians]

            expect(olympians).to be_a Array
            expect(olympians.length).to eq(2)
            expect(olympians[0]).to be_a Hash
            expect(olympians[0][:name]).to eq(@olympian_1.name)
            expect(olympians[0][:age]).to eq(@olympian_1.age)
            expect(olympians[0][:sport]).to eq(@olympian_1.sport.name)
            expect(olympians[0][:team]).to eq(@olympian_1.team.name)
            expect(olympians[0][:total_medals_won]).to eq(1)
            expect(olympians[1][:name]).to eq(@olympian_2.name)
            expect(olympians[1][:age]).to eq(@olympian_2.age)
            expect(olympians[1][:sport]).to eq(@olympian_2.sport.name)
            expect(olympians[1][:team]).to eq(@olympian_2.team.name)
            expect(olympians[1][:total_medals_won]).to eq(0)
         end

         it 'can optionally filter by youngest olympian' do
            get '/api/v1/olympians?age=youngest'

            olympians = JSON.parse(response.body, symbolize_names: true)[:olympians]

            expect(olympians).to be_a Array
            expect(olympians.length).to eq(1)
            expect(olympians[0]).to be_a Hash
            expect(olympians[0][:name]).to eq(@olympian_2.name)
            expect(olympians[0][:age]).to eq(@olympian_2.age)
            expect(olympians[0][:sport]).to eq(@olympian_2.sport.name)
            expect(olympians[0][:team]).to eq(@olympian_2.team.name)
            expect(olympians[0][:total_medals_won]).to eq(0)
         end
      end
   end
end