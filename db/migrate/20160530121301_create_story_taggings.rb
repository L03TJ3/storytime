class CreateStoryTaggings < ActiveRecord::Migration
  def change
    create_table :story_taggings do |t|
      t.belongs_to :story, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
