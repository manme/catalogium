class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :sku
      t.string :hashid
      t.integer :position
      t.string :state
      t.jsonb :content

      t.timestamps null: false
    end
  end
end
