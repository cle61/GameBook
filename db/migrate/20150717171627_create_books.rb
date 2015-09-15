class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.belongs_to :user, index: true
    	t.string :title
    	t.text :description
    	t.decimal :price, :precision => 10, :scale => 2
    	t.boolean :publish, default: false

     	t.timestamps
    end
  end
end
