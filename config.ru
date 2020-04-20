require_relative './config/environment'
# require './config/environment'

use Rake::MethodOverride
run ApplicationController
use UsersController
use PostsController