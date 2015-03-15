class AddStateToMenuCategory < ActiveRecord::Migration
  def change
    add_column :menu_categories, :state, :integer
  end
end
