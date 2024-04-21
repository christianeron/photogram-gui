class UserController < ApplicationController
  def list
      render ({:template => "users/index"})

  end

  def detail
    render ({:template => "users/show"})
  end

end
