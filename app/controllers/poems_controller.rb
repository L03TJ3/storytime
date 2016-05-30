class PoemsController < ApplicationController

  def index
    @poems = Poem.all.sort_by { |poem| poem.title }
  end

  def show
    @poem = Poem.find( params[:id] )
  end

  def new
    @poem = Poem.new
    @poem.author_id = params[:author_id]
  end

  def create
    @poem = Poem.new( poem_params )
    @tags = Poem.tagging( @poem.content )

    if @poem.save
      @tags.each do |tag_name|
        if tag = Tag.find_by( name: tag_name )
          PoemTagging.create( poem: @poem, tag: tag )
        end
      end
      redirect_to poems_path
    else
      render 'new'
    end
  end

  private

    def poem_params
      params.require( :poem ).permit( :title, :content, :metaphor, :date,
                                                                    :author_id )
    end
end
