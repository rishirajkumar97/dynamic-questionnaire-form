class Question < ApplicationRecord
  belongs_to :form, class_name: 'Form'
  has_many :answers, dependent: :destroy_async
  accepts_nested_attributes_for :answers
  enum answer_type: { numerical: 0, text: 1, mcq: 2, terminator: 3 }
end