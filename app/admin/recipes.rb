# This file is used to configure the admin panel for the recipes.

ActiveAdmin.register Recipe do
  # Disable the filters on the index page.
  config.filters = false

  # allow to edit and delete recipes, but not create new ones
  actions :all, except: [:new, :create]

  # index page columns
  index do
    id_column
    column :title
    column :description
    actions
  end
end
