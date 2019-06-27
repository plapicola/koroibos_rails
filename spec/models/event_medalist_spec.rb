require 'rails_helper'

RSpec.describe EventMedalist, type: :model do
  describe 'Relationships' do
    it {should belong_to :olympian}
    it {should belong_to :event}
  end

  describe 'Validations' do
    it {should define_enum_for(:medal).with_values(%i(gold silver bronze))}
  end

end
