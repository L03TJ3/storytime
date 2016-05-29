class AuthorTagging < ActiveRecord::Base
  belongs_to :author
  belongs_to :tag
end
