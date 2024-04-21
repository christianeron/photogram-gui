class PhotoController < ApplicationController
  def list
      render({:template => "photos/index"})
  end

  def detail
    render({:template => "photos/show"})
  end

end
