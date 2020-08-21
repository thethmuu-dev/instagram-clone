class CreateImagePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :image_posts do |t|
      t.text :caption
      t.string :image
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
