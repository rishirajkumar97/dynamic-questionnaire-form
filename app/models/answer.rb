# == Schema Information
#
# Table name: answers
#
#  id               :bigint           not null, primary key
#  value            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  form_id          :integer
#  next_question_id :integer
#  question_id      :integer
#
# Indexes
#
#  index_answers_on_form_id_and_question_id_and_id  (form_id,question_id,id)
#  index_answers_on_next_question_id                (next_question_id)
#  index_answers_on_question_id                     (question_id)
#
class Answer < ApplicationRecord
    belongs_to :form, optional: true
    belongs_to :question , optional: true
    belongs_to :next_question , :class_name => "Question", optional: true
end
