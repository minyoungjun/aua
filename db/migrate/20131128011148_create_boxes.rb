#coding: utf-8
class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :paragraph_id
      t.integer :content_type, :default => 1 #1:객관식 2: 주관식 3:이미지 4:중복가능객관식
      t.text :question
      t.string  :image_path
      t.timestamps
    end
  end
end
