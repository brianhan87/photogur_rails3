class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :artist
      t.string :title
      t.string :url
      t.timestamps
    end

    create_table :commments do |t|
    	t.belongs_to :picture
    	t.string :text
    	t.timestamps
    end
  end
end
