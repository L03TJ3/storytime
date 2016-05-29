class Tag < ActiveRecord::Base
  has_many :authors_taggings
  has_many :authors, through: :author_taggings
end
