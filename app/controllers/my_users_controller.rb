class MyUsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    authorize! :index,  @users = User.all
  end

  # def create
  #
  # end
end
