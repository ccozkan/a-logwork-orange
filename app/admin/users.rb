ActiveAdmin.register User do
  actions :all, except: [:edit, :new, :create]
  config.filters = false

  controller do
    before_action :bound_worklog_time_span

    def bound_worklog_time_span
      @worklogs = if params[:bound] == 'last_week'
                    Worklog.of_last_week
                  elsif params[:bound] == 'last_month'
                    Worklog.of_last_month
                  else
                    Worklog.all
                  end
    end
  end

  index do
    id_column
    column :email
    column :time_spent_in_minutes do |resource|
      worklogs.where(user_id: resource.id).map(&:duration_in_minutes).sum
    end
    column :created_at
    actions
  end

  action_item only: :index do
    link_to 'last week', admin_users_path(bound: 'last_week')
  end

  action_item only: :index do
    link_to 'last month', admin_users_path(bound: 'last_month')
  end

  action_item only: :index do
    link_to 'all time', admin_users_path
  end

  show do
    attributes_table do
      row :email
      row :created_at
    end
  end
end
