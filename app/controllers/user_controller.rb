class UserController < ApplicationController
  def list
      render ({:template => "users/index"})

  end

  def detail
    this_user_id = params.fetch("username")
    @this_user = User.where(:username => this_user_id).at(0)

    render ({:template => "users/show"})
  end

  def create
    @user = User.new
    @user.username = params.fetch("query_name")
    if @user.valid?
      @user.save
      redirect_to("/users/#{params.fetch("query_name")}")
    else
      redirect_to("/users", { :notice => "User failed to create successfully." })
    end
  end

  def update
    user_to_update = params.fetch("username")
    @user = User.where(:username => user_to_update).at(0)
    @user.username = params.fetch("query_name")
    if @user.valid?
      @user.save
      redirect_to("/users/#{params.fetch("query_name")}")
    else
      redirect_to("/users", { :notice => "User failed to update successfully." })
    end
  end

end
