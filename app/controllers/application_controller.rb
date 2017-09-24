class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private
    def current_user
      # sample authentication for sample app
      # not meant to be fully baked
      User.find_by_id(session[:user_id])
    end

    def login(user)
      # sample authentication for sample app
      # not meant to be fully baked
      session[:user_id] = user.id
    end

    def logout
      # sample authentication for sample app
      # not meant to be fully baked
      session[:user_id] = nil
    end
end
