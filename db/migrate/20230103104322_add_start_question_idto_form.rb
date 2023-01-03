class AddStartQuestionIdtoForm < ActiveRecord::Migration[6.1]
  def change
    add_column :forms, :start_question_id, :integer
  end
end
