class PhotoService

  def initialize(resource_token)
    @resource_token = resource_token
  end

  def attach_to_resource(imageable)
    Photo.where(@resource_token.merge(imageable_id: nil)).each do |photo|
      photo.imageable = imageable
      photo.save
    end
  end
end