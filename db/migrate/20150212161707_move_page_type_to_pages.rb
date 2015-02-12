class MovePageTypeToPages < ActiveRecord::Migration
  def change
    remove_column :top_menus, :page_type
    add_column :pages, :page_type, :string
  end
end
