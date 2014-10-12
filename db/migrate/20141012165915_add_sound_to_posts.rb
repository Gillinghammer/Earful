class AddSoundToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sound, :string
  end
end
