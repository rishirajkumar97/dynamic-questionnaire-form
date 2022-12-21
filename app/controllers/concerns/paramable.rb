# frozen_string_literal: true

# Module to support for easier Params
module Paramable
  extend ActiveSupport::Concern

  def forms_post_params
    {
      name: params[:name],
      description: params[:description],
      questions_attributes: (params[:form_data] || []).map do |question|
        # TODO: Add Question Attributes by parsing to Question.rb Schema Format(Accepts Nested Attributes of Answers.)
      end
    }
  end
end