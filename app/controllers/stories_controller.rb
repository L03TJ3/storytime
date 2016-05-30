class StoriesController < ApplicationController
  def index
    @stories = Story.all.sort_by { |story| story.title }
  end

  def show
    @story = Story.find( params[:id] )
  end

  def new
    @story = Story.new
    @story.author_id = params[:author_id]
  end

  def create
    @story = Story.new( story_params )
    @tags = Story.tagging( @story.content )

    if @story.save
      # Iterates through the @tags array and for every tag
      # Creates a record in the join table with story_id and tag_id
      @tags.each do |tag_name|
        if tag = Tag.find_by( name: tag_name )
          StoryTagging.create( story: @story, tag: tag )
        end
      end
      redirect_to stories_path
    else
      render 'new'
    end
  end

  def destroy
    @story = Story.find( params[:id] )
    author_id = @story.author_id
    @story.destroy
    redirect_to author_path( author_id )
  end

  private

    def story_params
      params.require( :story ).permit( :title, :content, :description, :date,
                                       :author_id )
    end
end
