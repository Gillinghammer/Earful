class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :tags
      t.text :content
      t.string :sound
      t.boolean :public

      t.timestamps
    end
  end
end
