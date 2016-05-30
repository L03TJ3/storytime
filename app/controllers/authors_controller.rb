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
    @author = Author.new( author_params )
    @tags = Author.tagging(@author.bio)

    if @author.save
      @tags.each do |tag_name|
        if tag = Tag.find_by( name: tag_name )
          AuthorTagging.create( author: @author, tag: tag )
        end
      end
      redirect_to authors_path
    else
      render 'new'
    end
  end

  private

    def author_params
      params.require( :author ).permit( :name, :bio )
    end
end
