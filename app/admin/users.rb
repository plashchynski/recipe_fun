ActiveAdmin.register User do
  config.filters = false

  actions :all, except: [:new, :create]

  index do
    id_column
    column :email
    column :first_name
    column :last_name
    column :created_at
    actions
  end
end
