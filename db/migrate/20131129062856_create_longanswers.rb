class CreateLonganswers < ActiveRecord::Migration
  def change
    create_table :longanswers do |t|
      t.integer :box_id
      t.text  :content
      t.timestamps
    end
  end
end
