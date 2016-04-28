class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :image
      t.string :video
      t.string :song
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
