# frozen_string_literal: true

class AnswerSerializer < ActiveModel::Serializer
    attributes :id,
               :question_id,
               :value,
               :next_question_id
  end