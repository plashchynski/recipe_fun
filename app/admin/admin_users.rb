# This file is used to configure the admin panel for the admin users.

ActiveAdmin.register AdminUser do
  # Disable the filters on the index page.
  config.filters = false

  # Parameters allowed to be edited.
  permit_params :email, :password, :password_confirmation

  # The index page columns.
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  # Edit form configuration.
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
