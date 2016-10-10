class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.
      find_by(email: user_params[:email]).
      try(:authenticate, user_params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end
end
