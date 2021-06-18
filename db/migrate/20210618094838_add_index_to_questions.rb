class AddIndexToQuestions < ActiveRecord::Migration[6.1]
  def change
  	add_index :questions, [:content, :role_id, :mapping_id], unique: true
  end
end
