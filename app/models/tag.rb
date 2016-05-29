class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :authors, through: :taggings
end
