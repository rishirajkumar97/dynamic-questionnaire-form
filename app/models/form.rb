# == Schema Information
#
# Table name: forms
#
#  id          :integer          not null, primary key
#  description :string           not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Form < ApplicationRecord
  has_many :questions, dependent: :destroy_async
end
