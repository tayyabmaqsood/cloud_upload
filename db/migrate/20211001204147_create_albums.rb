class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.string :owner

      t.timestamps
    end
  end
end
