class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :survey_id
      t.string  :realname
      t.string  :department
      t.string  :phone
      t.timestamps
    end
  end
end
