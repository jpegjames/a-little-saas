class SessionsController < ApplicationController
  # login
  def new
  end

  def create
    user = User.find_by(login: params[:login])

    if user && user.authenticate(params[:password])
      # login method
      login(user)
      redirect_to posts_url, notice: 'Login Successful!'

    else
      # wrong email/password
      flash[:notice] = 'Login incorrect'
      render :new
    end
  end

  # logout
  def destroy
    logout()
  end
end
