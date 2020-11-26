ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Worklogs" do
          ul do
            Worklog.last(5).map do |worklog|
              li link_to(worklog[:time_type] + ' ' + worklog.duration_in_minutes.to_s + "'", admin_worklog_path(worklog))
            end
          end
        end
      end
    end
  end
end
