class UsersController < ApplicationController
  def show
    @user = helpers.current_user
    @plants = Plant.all.order(name: :asc)
  end
end
