class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :forms do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.timestamps
    end

    create_table :questions do |t|
      t.integer :form_id, references: 'forms', index: true, foreign_key: true, null: false
      t.integer :answer_type, null: false
      t.json :additional_attributes
      t.timestamps
    end

    add_index :questions, [:form_id, :id]

    create_table :answers do |t|
      t.string :value
      t.integer :form_id
      t.integer :question_id, referensces: 'questions', index: true, foreign_key: true, null: false
      t.timestamps
    end

    add_index :answers, [:form_id, :question_id, :id]
  end
end
