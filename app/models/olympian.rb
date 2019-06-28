class Olympian < ApplicationRecord
  belongs_to :team
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :medals, foreign_key: :olympian_id, class_name: "EventMedalist"

  enum sex: %i(male female)

  def self.all_with_medals
    left_joins(:medals)
    .select("olympians.*, COUNT(event_medalists.id) AS total_medals_won")
    .group(:id)
    .includes(:team, :sport)
    .order(:id)
  end

  def self.youngest
    left_joins(:medals)
    .select("olympians.*, COUNT(event_medalists.id) AS total_medals_won")
    .group(:id)
    .includes(:team, :sport)
    .order(age: :asc)
    .limit(1)
  end
end
