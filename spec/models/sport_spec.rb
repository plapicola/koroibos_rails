require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe "Relationships" do
    it {should have_many :olympians}
    it {should have_many :events}
  end
end
