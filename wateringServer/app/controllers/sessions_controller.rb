class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = helpers.current_user

    if flash[:error]
      @errors = [] << flash[:error]
    end

    if @user
      redirect_to @user
    else
      @user = User.new
    end
  end

  def create
    @user = User.
      find_by(email: user_params[:email]).
      try(:authenticate, user_params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = ["Invalid username or password"]
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end
end
