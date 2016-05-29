class AuthorsController < ApplicationController

  def index
    @authors = Author.all.sort_by { |author| author.name }
  end

  def show
    @author = Author.find( params[:id] )
  end


  def new
    @author = Author.new
  end

  def create
  end



  private

    def author_params
      params.require( :author ).permit( :name, :bio)
    end
end
