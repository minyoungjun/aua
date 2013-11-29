class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :example_id
      t.string  :etc_answer
      t.timestamps
    end
  end
end
