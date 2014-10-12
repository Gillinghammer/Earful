class RemoveSoundFileNameAndSoundContentTypeAndSoundFileSizeAndSoundUpdatedAtFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :sound_file_name
    remove_column :posts, :sound_content_type
    remove_column :posts, :sound_file_size
    remove_column :posts, :sound_updated_at
  end

  def down
    remove_column :posts, :sound_file_name
    remove_column :posts, :sound_content_type
    remove_column :posts, :sound_file_size
    remove_column :posts, :sound_updated_at
end
end