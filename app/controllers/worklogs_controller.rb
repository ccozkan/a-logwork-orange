class WorklogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @worklogs = current_user.worklogs.order(ending_at: :desc)
  end

  def create
    @worklog = Worklog.new(worklog_params)
    @worklog.user_id = current_user.id
    if @worklog.save
      redirect_to worklogs_path, notice: 'Successfully saved!'
    else
      redirect_to worklogs_path, alert: @worklog.errors.full_messages.join(' - ')
    end
  end

  private

  def worklog_params
    params.require(:worklog).permit(:time_type, :starting_at, :ending_at, :remark)
  end
end
