class UsersController < ApplicationController
    get '/register' do
        erb :'/users/register'
    end

    post '/register' do
        if params[:name].present? && params[:email].present? && params[:password].present?
            @user = User.create(name: params[:name], email: params[:email], password: params[:password])
            session[:id] = @user.id
        else redirect to :'/register'
        end
        erb :'/posts/index'
    end

    get '/login' do
        erb :'/users/login'
    end
end