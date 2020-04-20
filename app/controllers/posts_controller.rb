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

    post '/posts/new' do
        if params[:title].present? && params[:content].present?
            @user = current_user
            @post = Post.create(title: params[:title], content: params[:content])
            @post.user_id = @user.id
            @post.save
            erb :'/posts'
          else redirect to :'/posts/new'
          end
    end

    get '/posts/:id' do
        if logged_in?
            @post = Post.find_by_id(params[:id])
            erb :'/posts/new'
          else redirect to :'/login'
          end
    end

    delete '/posts/:id/delete'do
        if logged_in?
            @post = Post.find_by(params[:id])
            @post.delete
            erb :'/posts/index'
        else redirect to :'/login'
        end
    end

    get '/posts/:id/edit' do
        if logged_in?
            @post = Post.find_by_id(params[:id])
            erb :'/posts/edit'
        else redirect to :'/login'
        end
    end
end