class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :duration
      t.belongs_to :album, foreign_key: true

      t.timestamps
    end
  end
end
