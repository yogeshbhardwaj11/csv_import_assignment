class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :content, null:false
      t.string :teaming_stages, null:false
      t.integer :appears_day, null:false
      t.integer :frequency, null:false
      t.string :question_type, null:false
      t.boolean :required, null:false
      t.string :conditions, null:false
      t.references :role, null: false, foreign_key: true
      t.references :mapping, null: false, foreign_key: true

      t.timestamps
    end
  end
end
