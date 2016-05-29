class Author < ActiveRecord::Base
  has_many :author_taggings
  has_many :tags, through: :author_taggings

  def self.tagging(text)
    text_array = text.scan(/\w+/).map(&:downcase)
    tags_array = Tag.pluck(:name)
    tags_array & text_array
  end
end
