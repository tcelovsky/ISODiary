class UsersController < ApplicationController
    get '/register' do
        erb :'users/register'
    end
end