module Admin
  class PhotosController < AdminController
    include PhotoHelper

    def create
      @photo = Photo.new(photo_params)

      if @photo.save
        render json: respond_photo.merge({ status: :created }),
               content_type: request.format

      else
        render json: { errors: @photo.errors, status: :unprocessable_entity },
               content_type: request.format
      end
    end

    def update
      @photo = Photo.find params[:id]

      @photo.crop_params = crop_params
      @photo.crop

      render json: respond_photo.merge({ status: :updated })
    end

    def destroy
      @photo = Photo.find params[:id]

      respond_to do |format|
        if @photo.delete
          format.html { redirect_to admin_posts_path, notice: 'Photo was successfully deleted' }
          format.json { render json: { id: @photo.id }, status: :ok }
        else
          format.html { redirect_to [:admin, :posts] }
          format.json do
            render json: { msg: "can't delete", id: @photo.id },
                   status: :unprocessable_entity
          end
        end
      end
    end

    private

    def photo_params
      params.require(:photo).permit(:file).merge(params.permit(:resource_token))
    end

    def crop_params
      params.slice(:x, :y, :width, :height, :ratio)
    end

    def respond_photo
      { id: @photo.id,
        thumb_url: @photo.file.url(:thumb),
        large_url: @photo.file.large.url,
        origin_preview_url: @photo.file.origin_preview.url,
        origin_dimensions: @photo.dimensions(:file),
        update_url: admin_photo_path(@photo)
      }.merge(modification_values(@photo))
    end
  end
end
