class AddCategoryToPosts < ActiveRecord::Migration[8.1]
  def change
    unless column_exists?(:posts, :category)
      add_column :posts, :category, :string
    end
  end
end
