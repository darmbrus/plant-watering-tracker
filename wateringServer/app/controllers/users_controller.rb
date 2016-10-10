class UsersController < ApplicationController
  def show
    @user = helpers.current_user
    if @user
      @plants = Plant.all
    else
      redirect_to '/'
    end
  end
end
