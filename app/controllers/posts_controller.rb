class PostsController < ApplicationController

    get '/posts' do
        if logged_in?
            erb :'/posts/index'
        else redirect to :'/login'
        end
    end

    get '/posts/new' do
        if logged_in?
            erb :'/posts/new'
        else redirect to :'/login'
        end
    end
end