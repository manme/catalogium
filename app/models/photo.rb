# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  file           :string
#  modification   :hstore
#  resource_token :string
#  imageable_id   :integer
#  imageable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Photo < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  mount_uploader :file, PhotoUploader

  validates_presence_of :file

  delegate :url, :current_path, to: :file

  # TRANSFORM_WIDTH = 657
  # TRANSFORM_HEIGHT = 406

  CROP_KEYS = %w(x y width height ratio)
  ASPECT_RATIO = 0

  # Params are: orig_height, orig_width, height = 406, width = 657, angle, top, left, scale
  # attr_reader :transform_params

  # Params are: x, y, width, height, ratio
  attr_reader :crop_params

  before_save :set_default_crop

  def dimensions(version = :file)
    @dimensions ||= {}
    @dimensions[version] ||= begin
      image = MiniMagick::Image.open(file.try(version).path)

      {
        width: image[:width],
        height: image[:height]
      }
    end
  end

  def crop_params=(params)
    @crop_params = {}
    @crop_params[:x] = params[:x].to_i if params[:x]
    @crop_params[:y] = params[:y].to_i if params[:y]
    @crop_params[:width] = params[:width].to_i if params[:width]
    @crop_params[:height] = params[:height].to_i if params[:height]
    @crop_params[:ratio] = params[:ratio].to_f.round(3) if params[:ratio]
    @crop_params
  end

  # def transform_params=(params)
  #   @transform_params = {}
  #   @transform_params[:orig_width] = params[:orig_width].to_i
  #   @transform_params[:orig_height] = params[:orig_height].to_i
  #   @transform_params[:top] = params[:top].to_f.round(3) if params[:top]
  #   @transform_params[:left] = params[:left].to_f.round(3) if params[:left]
  #   @transform_params[:angle] = params[:angle].to_f.round(3)
  #   @transform_params[:scale] = params[:scale].to_f.round(3)
  #   @transform_params[:width] = TRANSFORM_WIDTH
  #   @transform_params[:height] = TRANSFORM_HEIGHT
  #   @transform_params
  # end

  # def transform
  #   return unless transforming?
  #
  #   update(updated_at: Time.now)
  #   file.recreate_versions!
  # end

  def crop
    return unless cropping?

    modification = {} if modification.nil?
    modification = modification.merge(crop_params)

    update(updated_at: Time.now, modification: modification)
    file.recreate_versions!
  end

  def cropping?
    crop_params && CROP_KEYS.map { |p| crop_params[p.to_sym] }.all?(&:present?)
  end

  # def transforming?
  #   transform_params && [transform_params[:top], transform_params[:left]].all?(&:present?)
  # end

  # def self.test_transform
  #   # File url: http://localhost:3000/uploads/photo/file/251/large_polejai.jpg
  #   p = Photo.find(274)
  #   p.crop_params = { x: 3, y: 106, w: 669, h: 212, ratio: 1.337295690936107 }
  #   p.crop
  # end

  def set_default_crop
    return unless self.new_record?
    size = self.dimensions(:origin_preview)

    if 1 == ASPECT_RATIO
      width = height = size.values.min
    else
      width = size[:width]
      height = size[:height]
    end

    x = (size[:width] - width) / 2
    y = (size[:height] - height) / 2
    self.modification = { x: x, y: y, width: width, height: width }
  end
end
