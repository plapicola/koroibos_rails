class EventMedalist < ApplicationRecord
  belongs_to :olympian
  belongs_to :event

  enum medal: %i(gold silver bronze)
end
