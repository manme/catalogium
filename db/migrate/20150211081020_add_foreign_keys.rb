class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :top_menus, :pages, dependent: :delete
    add_foreign_key :menu_categories, :categories, dependent: :delete
    add_foreign_key :products, :categories
  end
end
