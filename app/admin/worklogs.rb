ActiveAdmin.register Worklog do
  actions :index, :show

  index do
    selectable_column
    id_column
    column :user_email do |resource|
      link_to resource.user.email, admin_user_path(resource.user.id)
    end
    column :user_id
    column :starting_at
    column :ending_at
    column :time_type do |resource|
      resource.time_type.humanize.upcase
    end
    actions
  end

  filter :'user', as: :searchable_select, multiple: true, collection: proc { User.all.map(&:id) }
  filter :'time_type', as: :searchable_select, multiple: true, collection: proc { Worklog.time_types.keys }
  filter :starting_at, as: :date_time_range
  filter :ending_at, as: :date_time_range

  show do
    attributes_table do
      row :user
      row :starting_at
      row :user_id
      row :ending_at
      row :time_type
    end
  end
end
