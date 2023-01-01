# frozen_string_literal: true

# BeverageIngredient: Serializer for rendering JSON response.
class QuestionSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :answer_type
end
