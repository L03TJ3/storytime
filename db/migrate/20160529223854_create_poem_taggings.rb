class CreatePoemTaggings < ActiveRecord::Migration
  def change
    create_table :poem_taggings do |t|
      t.belongs_to :poem, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
