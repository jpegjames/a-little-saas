class DemosController < ApplicationController
  def new
    # Optional: setting session[:demo_db] to nil will reset the demo
    session[:demo_db] = nil
    logout()
  end

  def create
    # make db/demos dir if doesn't exist
    unless File.directory?('db/demos/')
      FileUtils.mkdir('db/demos/')
    end

    # copy master 'demo' database
    master_db = default_demo_database
    demo_db = "db/demos/demo-#{Time.now.to_i}.sqlite3"
    FileUtils::cp master_db, demo_db

    # set session for new db
    session[:demo_db] = demo_db

    # Optional: login code (if applicable)
    # add your own login code or method here
    login(User.first)

    # Redirect to wherever you want to send the user next
    flash[:notice] = 'You are using the demo database'
    redirect_to root_path
  end
end
