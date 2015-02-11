class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.references :category
      t.integer :position

      t.timestamps null: false
    end
  end
end
