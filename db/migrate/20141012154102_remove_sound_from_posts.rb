class RemoveSoundFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :sound
  end

  def down
    add_column :posts, :sound, :string
  end
end
