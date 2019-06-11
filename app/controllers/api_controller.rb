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
    puts params['id']
    puts params['email']
    puts params['message']
  end

end
