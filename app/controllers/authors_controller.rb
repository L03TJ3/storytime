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

    # Stored found keywords in variable @tags
    @tags = Author.tagging(@author.bio)

    if @author.save
      # Iterates through the @tags array and for every tag
      # Creates a record in the join table with author_id and tag_id
      @tags.each do |tag_name|
        if tag = Tag.find_by( name: tag_name )
          AuthorTagging.create( author: @author, tag: tag )
        end
      end
      redirect_to @author
    else
      render 'new'
    end
  end

  def destroy
    @author = Author.find( params[:id] )

    @author.destroy

    redirect_to authors_path
  end

  private

    def author_params
      params.require( :author ).permit( :name, :bio )
    end
end
