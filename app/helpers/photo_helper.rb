module PhotoHelper
  def modification_values(photo)
    photo.modification.symbolize_keys
  end
end

