require_relative './config/environment'
# require './config/environment'

run ApplicationController
use UsersController
use PostsController