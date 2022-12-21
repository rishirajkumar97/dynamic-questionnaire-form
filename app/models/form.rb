class Form < ApplicationRecord
  has_many :questions, dependent: :destroy_async
end