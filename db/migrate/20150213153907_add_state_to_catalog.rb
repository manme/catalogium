class AddStateToCatalog < ActiveRecord::Migration
  def change
    add_column :catalogs, :state, :string
  end
end
