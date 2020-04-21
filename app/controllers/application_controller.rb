class ApplicationController < Sinatra::Base
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, 'secret'

    get '/' do
        erb :home
    end

    helpers do
        def current_user
            # find the current user by user id in the session hash
            @current_user ||= User.find_by(id: session[:id]) if session[:id]
          end
      
          def logged_in?
            # check that the user is logged in by making sure that the session hash exists
            !!current_user
          end
    end
end