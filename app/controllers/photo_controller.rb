class PhotoController < ApplicationController
  def list
      render({:template => "photos/index"})
  end

  def detail
    this_photo_id = params.fetch("photo_id")
    @this_photo = Photo.where(:id => this_photo_id).at(0)

    render({:template => "photos/show"})
  end

  def create
    @photo = Photo.new
    @photo.image = params.fetch("query_image")
    @photo.caption = params.fetch("query_caption")
    @photo.owner_id = params.fetch("query_user")
    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{@photo.id}")
    else
      redirect_to("/photos", { :notice => "Photo failed to create successfully." })
    end
  end

  def update
    this_photo_id = params.fetch("photo_id")
    @photo = Photo.where(:id => this_photo_id).at(0)
    @photo.image = params.fetch("query_image")
    @photo.caption = params.fetch("query_caption")
    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{this_photo_id}")
    else
      redirect_to("/photos", { :notice => "Photo failed to create successfully." })
    end
  end

  def delete
    photo_id_to_delete = params.fetch("toast_id")
    @photo_to_delete = Photo.where(:id => photo_id_to_delete).at(0)
    @photo_to_delete.destroy
    redirect_to("/photos", { :notice => "Department deleted successfully."})
  end


end
