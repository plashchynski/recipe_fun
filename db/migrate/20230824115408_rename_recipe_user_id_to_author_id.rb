class RenameRecipeUserIdToAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :user_id, :author_id
  end
end
