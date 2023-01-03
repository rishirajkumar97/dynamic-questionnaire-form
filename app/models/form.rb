# == Schema Information
#
# Table name: forms
#
#  id                :bigint           not null, primary key
#  description       :string           not null
#  name              :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  start_question_id :integer
#
class Form < ApplicationRecord
  has_many :questions, dependent: :destroy_async
  has_many :answers, dependent: :destroy_async
end
