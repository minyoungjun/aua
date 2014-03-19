class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.string  :title
      t.timestamps
    end
  end
end
