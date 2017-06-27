class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :album_art_url
      t.belongs_to :artist, foreign_key: true

      t.timestamps
    end
  end
end
