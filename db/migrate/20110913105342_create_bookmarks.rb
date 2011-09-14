class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url, :null => false
      t.string :tinyurl
      t.string :title
      t.date    :last_modified
      t.integer :site_id, :null => false

      t.timestamps
    end
  end
end
