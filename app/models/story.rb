class Story < ActiveRecord::Base
  belongs_to :author
  has_many :story_taggings
  has_many :tags, through: :story_taggings

  def self.tagging(text)
    text_array = text.scan(/\w+/).map(&:downcase)
    tags_array = Tag.pluck(:name)
    tags_array & text_array
  end
end
