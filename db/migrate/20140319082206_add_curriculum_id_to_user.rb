class AddCurriculumIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :curriculum_id, :integer
  end
end
