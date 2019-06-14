require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Relationships' do
    it {should belong_to :sport}
    it {should have_many :olympian_events}
    it {should have_many :event_medalists}
    it {should have_many(:olympians).through(:olympian_events)}
  end
end
