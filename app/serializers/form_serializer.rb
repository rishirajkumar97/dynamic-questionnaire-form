# frozen_string_literal: true

class FormSerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :description,
               :answers,
               :questions,
               :created_at,
               :updated_at
  
    has_many :answers
    has_many :questions
  end