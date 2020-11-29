class WorklogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @worklogs = current_user.worklogs.order(ending_at: :desc)
  end
end
