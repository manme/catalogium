class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :title
      t.string :description
      t.string :slug

      t.timestamps null: false
    end
  end
end
