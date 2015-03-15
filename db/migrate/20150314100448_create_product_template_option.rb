class CreateProductTemplateOption < ActiveRecord::Migration
  def change
    create_table :product_template_options do |t|
      t.string :name
      t.string :type
      t.jsonb :options
      t.string :default

      t.timestamps null: false
    end
  end
end
