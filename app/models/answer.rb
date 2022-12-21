# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  value       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  form_id     :integer
#  question_id :integer          not null
#
# Indexes
#
#  index_answers_on_form_id_and_question_id_and_id  (form_id,question_id,id)
#  index_answers_on_question_id                     (question_id)
#
class Answer < ApplicationRecord
end
