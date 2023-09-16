# This file is used to configure the admin panel for the users.

ActiveAdmin.register User do
  # Disable the filters on the index page.
  config.filters = false

  # allow to edit and delete users, but not create new ones
  actions :all, except: [:new, :create]

  # index page columns
  index do
    id_column
    column :email
    column :first_name
    column :last_name
    column :created_at
    actions
  end
end
