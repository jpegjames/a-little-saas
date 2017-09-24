class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_demo_database, if: -> { Rails.env == 'demo' }

  private
    # Methods for handling which database to use
    # -------------------------------------------------

    # sets the database for the demo environment
    def set_demo_database
      # method only necessary for 'demo' environment
      if session[:demo_db]
        # Use database set by demos_controller
        db_name = session[:demo_db]
      else
        # Use default 'demo' database
        db_name = default_demo_database
      end

      ActiveRecord::Base.establish_connection(demo_connection(db_name))
    end

    # Returns the current database configuration hash
    def default_connection_config
      @default_config ||= ActiveRecord::Base.connection.instance_variable_get("@config").dup
    end

    # Returns the connection hash but with database name changed
    # The argument should be a path
    def demo_connection(db_path)
      default_connection_config.dup.update(database: db_path)
    end

    # Returns the default demo database path defined in config/database.yml
    def default_demo_database
      return YAML.load_file("#{Rails.root.to_s}/config/database.yml")['demo']['database']
    end



    # Sample authentication methods
    # -------------------------------------------------

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
