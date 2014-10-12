class AddWaveformToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :waveform, :string
  end
end
