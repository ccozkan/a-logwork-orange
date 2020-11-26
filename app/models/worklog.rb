class Worklog < ApplicationRecord
  validates_presence_of :starting_at
  validates_presence_of :ending_at
  validates_presence_of :time_type
  enum time_type: [ :self_improvement, :dayjob, :side_project ]
end
