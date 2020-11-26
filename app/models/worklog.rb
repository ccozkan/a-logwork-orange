class Worklog < ApplicationRecord
  belongs_to :user
  validates_presence_of :starting_at
  validates_presence_of :ending_at
  validates_presence_of :time_type
  enum time_type: [ :self_improvement, :dayjob, :side_project ]

  def duration_in_minutes
    ((ending_at - starting_at) / 1.minute).to_i
  end
end
