class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :top_menus, :page_id
    add_index :product_template_options, :product_template_id
    add_index :products, :category_id
    add_index :products, :catalog_id
    add_index :menu_categories, :category_id
  end
end
