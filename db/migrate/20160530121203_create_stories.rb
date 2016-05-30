class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.string :description
      t.datetime :date
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
