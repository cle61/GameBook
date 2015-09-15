class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
    	t.belongs_to :book, index: true
    	t.integer :nb_chapter
    	t.integer :order
    	t.string :title
    	t.text :content

      	t.timestamps
    end
  end
end
