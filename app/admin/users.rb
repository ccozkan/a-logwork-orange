ActiveAdmin.register User do
  actions :all, except: [:edit, :new, :create]
  config.filters = false

  index do
    id_column
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :created_at
      row :time_spent_in_minutes do |resource|
        resource.worklogs.map{ |w| w.duration_in_minutes }.sum
      end
    end
  end
end
