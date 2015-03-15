class CreateProductTemplate < ActiveRecord::Migration
  def change
    create_table :product_templates do |t|
      t.string :name
      t.references :product_template_option

      t.timestamps null: false
    end
  end
end
