class Author < ActiveRecord::Base
  has_many :poems, dependent: :destroy
  has_many :author_taggings, dependent: :destroy
  has_many :tags, through: :author_taggings, dependent: :destroy


  # Seperates text in single words and compares them to the list
  # of predefined keywords which result in an array of the keywords
  # that are present in the text
  def self.tagging(text)
    text_array = text.scan(/\w+/).map(&:downcase)
    tags_array = Tag.pluck(:name)
    tags_array & text_array
  end
end
