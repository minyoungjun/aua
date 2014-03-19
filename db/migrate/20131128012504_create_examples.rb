class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.integer :box_id
      t.text :content
      t.integer :example_type, :default => 1
      t.timestamps
    end
  end
end
