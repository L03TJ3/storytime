class CreateAuthorTaggings < ActiveRecord::Migration
  def change
    create_table :author_taggings do |t|
      t.belongs_to :author, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
