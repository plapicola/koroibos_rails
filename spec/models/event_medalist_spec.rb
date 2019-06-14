require 'rails_helper'

RSpec.describe EventMedalist, type: :model do
  describe 'Relationships' do
    it {should belong_to :olympian}
    it {should belong_to :event}
  end
end
