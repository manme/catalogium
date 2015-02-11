class AddCatalogIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :catalog_id, :integer
    add_foreign_key :products, :catalogs, dependent: :delete
  end
end
