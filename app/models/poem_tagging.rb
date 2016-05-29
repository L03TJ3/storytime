class PoemTagging < ActiveRecord::Base
  belongs_to :poem
  belongs_to :tag
end
