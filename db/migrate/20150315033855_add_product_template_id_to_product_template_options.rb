class AddProductTemplateIdToProductTemplateOptions < ActiveRecord::Migration
  def change
    add_column :product_template_options, :product_template_id, :integer
  end
end
