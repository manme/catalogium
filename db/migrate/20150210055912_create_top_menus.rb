class CreateTopMenus < ActiveRecord::Migration
  def change
    create_table :top_menus do |t|
      t.string :name
      t.string :page_type
      t.integer :position
      t.references :pages

      t.timestamps null: false
    end
  end
end
