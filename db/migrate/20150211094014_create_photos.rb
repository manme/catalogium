class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file
      t.hstore :modification
      t.string :resource_token
      t.references :imageable, polymorphic: true

      t.timestamps null: false
    end

    add_index :photos, [:imageable_id, :imageable_type]
    add_index :photos, :resource_token
  end
end
