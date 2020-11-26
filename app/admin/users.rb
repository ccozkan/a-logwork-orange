ActiveAdmin.register User do
  actions :all, except: [:edit, :new, :create]

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :created_at

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
