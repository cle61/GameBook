class CreateChapterActions < ActiveRecord::Migration
  def change
    create_table :chapter_actions do |t|
    	t.belongs_to :chapter, index: true
    	t.belongs_to :chapter
    	t.text :content

      	t.timestamps
    end
  end
end
