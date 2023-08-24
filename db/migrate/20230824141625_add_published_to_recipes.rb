class AddPublishedToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :published, :boolean
    add_index :recipes, :published
  end
end
