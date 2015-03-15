class AddStateToTopMenu < ActiveRecord::Migration
  def change
    add_column :top_menus, :state, :string
  end
end
