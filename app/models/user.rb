class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :worklogs, dependent: :destroy

  def total_worklog_duration_in_minutes
    return 0 if worklogs.blank?

    total_minutes = worklogs.map(&:duration_in_minutes).sum
  end
end
