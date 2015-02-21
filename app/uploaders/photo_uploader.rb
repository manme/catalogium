# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def url(options = {})
    super.split('?v=')[0] + "?v=#{model.updated_at.to_time.to_i}" rescue super
  end

  # def filename
  #   # "#{secure_token(10)}.#{file.extension}" if original_filename.present?
  # end
  # MAX_FILENAME_LENGTH = 64 # arbitrary limit, your milage may vary
  #
  # def full_original_filename
  #   filename = super
  #
  #   return filename if !filename.present?
  #
  #   extension = File.extname(filename)
  #   basename = File.basename(filename, extension)[0...MAX_FILENAME_LENGTH]
  #   basename + extension
  # end

  version :origin_preview do
    process resize_to_fit: [400, 400]
  end

  version :origin_modified do
    process :process_image
  end

  version :large, from_version: :origin_modified do
    process resize_to_fill: [400, 400]
  end

  version :thumb, from_version: :origin_modified do
    process resize_to_fill: [200, 200]
  end

  def process_image
    # transform_picture if transforming?
    crop_picture  if cropping?
  end

  def crop_picture
    manipulate! do |img|
      return unless model.cropping?
      params = model.crop_params
      left_offset = format_offset(params[:x] * params[:ratio])
      top_offset = format_offset(params[:y] * params[:ratio])
      crop_width = params[:width] * params[:ratio]
      crop_height = params[:height] * params[:ratio]

      img.crop("#{crop_width}x#{crop_height}#{left_offset}#{top_offset}")
      img = yield(img) if block_given?
      img
    end
  end

  # rubocop:disable Style/MethodLength
  # def transform_picture
  #   manipulate! do |img|
  #     return unless model.transforming?
  #     params = model.transform_params
  #     # Scaled dimensions of transforming image
  #     scaled_width = params[:orig_width] * params[:scale]
  #     scaled_height = params[:orig_height] * params[:scale]
  #
  #     # Rotation angle in radians
  #     # There is a different rotation in imagemagick and in mathematics
  #     theta = (-params[:angle] / 180) * Math::PI
  #
  #     # Coords of left top corner relative to the center of image
  #     x = - scaled_width / 2
  #     y =   scaled_height / 2
  #
  #     # Coords of left top corner after rotation
  #     after_rotation_x = x * Math.cos(theta) - y * Math.sin(theta)
  #     after_rotation_y = x * Math.sin(theta) + y * Math.cos(theta)
  #
  #     # Image rotation
  #     img.combine_options do |c|
  #       c.background '#ffffff'
  #       c.gravity 'center'
  #       c.resize "#{scaled_width}x#{scaled_height}"
  #       c.rotate "#{params[:angle]}"
  #     end
  #
  #     # Dimensions of image after rotation
  #     rotated_width, rotated_height = img[:dimensions]
  #
  #     # Offset for croppping
  #     # 1. we find the offset that was received after rotation
  #     # 2. rotation offset and move offset combined together
  #     top_offset = (rotated_height / 2 - after_rotation_y - params[:top]).abs
  #     left_offset = ((-rotated_width / 2) - after_rotation_x + params[:left]).abs
  #
  #     top_offset = format_offset(top_offset.round(1))
  #     left_offset = format_offset(left_offset.round(1))
  #
  #     img.crop("#{params[:width]}x#{params[:height]}#{left_offset}#{top_offset}")
  #     img = yield(img) if block_given?
  #     img
  #   end
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  protected

  # def transforming?
  #   model.transforming?
  # end

  def cropping?
    model.cropping?
  end

  private

  def format_offset(value)
    value = 0 unless value
    value >= 0 ? "+#{value}" : value.to_s
  end
end
