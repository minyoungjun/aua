class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.integer :survey_id
      t.string  :title
      t.timestamps
    end
  end
end
