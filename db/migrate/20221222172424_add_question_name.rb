class AddQuestionName < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :name, :string
  end
end
