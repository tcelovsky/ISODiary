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

    post '/posts' do
        # the route should be '/posts' not '/posts/new' - DONE
        if params[:title].present? && params[:content].present?
            @user = current_user
            @post = Post.create(title: params[:title], content: params[:content])
            @post.user_id = @user.id
            @post.save
            redirect to :"/posts/#{@post.id}" 
            # add post id from params here. - DONE
        else erb :'/posts/new'
        end
    end

    get '/posts/:id' do
        @post = Post.find_by_id(params[:id])
        if @post.user_id == session[:id]
            erb :'/posts/show'
        else redirect to :'/login'
        end
    end

    delete '/posts/:id/delete'do
        if logged_in? 
            @post = Post.find_by(params[:id])
            @post.delete
            # check why the post is not being deleted. - SEEMS TO BE WORKING
            erb :'/posts/index'
        else redirect to :'/login'
        end
    end

    get '/posts/:id/edit' do
        i@post = Post.find_by_id(params[:id])
        if @post.user_id == session[:id]
            erb :'/posts/edit'
        else redirect to :'/login'
        end
    end

    patch '/posts/:id' do
        if params[:title].present? && params[:content].present?
            @post = Post.find_by_id(params[:id])
            @post.title = params[:title]
            @post.content = params[:content]
            @post.save
            redirect to :"/posts/#{@post.id}"
            # should redirect to '/posts/show' - DONE
        else erb :'/posts/edit'
        end
    end
end