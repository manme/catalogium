class AddCategoryIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :category_id, :integer, index: true
  end
end
