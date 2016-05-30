class Poem < ActiveRecord::Base
  belongs_to :author
  has_many :poem_taggings
  has_many :tags, through: :poem_taggings

  # Seperates text in single words and compares them to the list
  # of predefined keywords which result in an array of the keywords
  # that are present in the text
  def self.tagging(text)
    text_array = text.scan(/\w+/).map(&:downcase)
    tags_array = Tag.pluck(:name)
    tags_array & text_array
  end
  
end
