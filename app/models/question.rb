# == Schema Information
#
# Table name: questions
#
#  id                    :bigint           not null, primary key
#  additional_attributes :json
#  answer_type           :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  form_id               :integer          not null
#
# Indexes
#
#  index_questions_on_form_id         (form_id)
#  index_questions_on_form_id_and_id  (form_id,id)
#
class Question < ApplicationRecord
  belongs_to :form, class_name: 'Form'
  has_many :answers, dependent: :destroy_async
  accepts_nested_attributes_for :answers
  enum answer_type: { numerical: 0, text: 1, mcq: 2, terminator: 3 }
end
