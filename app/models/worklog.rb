class Worklog < ApplicationRecord
  belongs_to :user
  validates_presence_of :starting_at
  validates_presence_of :ending_at
  validates_presence_of :time_type
  validate :consistency_of_time_interval

  enum time_type: [ :self_improvement, :dayjob, :side_project ]

  def consistency_of_time_interval
    return if starting_at.nil? && ending_at.nil? || ending_at > starting_at

    errors.add(:ending_at, 'must be greater than starting_at')
  end

  def duration_in_minutes
    ((ending_at - starting_at) / 1.minute).to_i
  end
end
