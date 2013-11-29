class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string  :title
      t.string  :content
      t.string  :top_image
      t.timestamps
    end
  end
end
