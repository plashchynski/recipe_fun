ActiveAdmin.register Recipe do
  config.filters = false

  actions :all, except: [:new, :create]
  index do
    id_column
    column :title
    column :description
    actions
  end
end
