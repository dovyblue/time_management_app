class Api::V1::TasksController < ApplicationController

  def index
    @categories = Category.all
    render 'index.json.jbuilder'
  end
end
