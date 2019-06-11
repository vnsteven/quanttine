class ApiController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    puts params
    puts
    puts 'NEXT LINE'
    puts params['id']
    puts params['email']
    puts params['message']
    puts Profile.find(params[:id]).user.first_name
    puts 'END OF CREATE ACTION OF API CONTROLLER'
  end

end
