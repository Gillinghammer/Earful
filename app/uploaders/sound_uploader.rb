# encoding: utf-8

class SoundUploader < CarrierWave::Uploader::Base
  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  def store_dir
    # "earful_uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    # "public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end


end
