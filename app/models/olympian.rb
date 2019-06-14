class Olympian < ApplicationRecord
  belongs_to :team
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :medals, foreign_key: :olympian_id, class_name: "EventMedalist"

  enum sex: %i(male female)
end
