require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe "Relationships" do
    it {should belong_to :team}
    it {should belong_to :sport}
    it {should have_many :olympian_events}
    it {should have_many(:events).through(:olympian_events)}
    it {should have_many :medals}
  end
end
