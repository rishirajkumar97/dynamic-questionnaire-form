# frozen_string_literal: true

# Module to support for easier Params
module Paramable
  extend ActiveSupport::Concern

  def forms_post_params
    {
      name: params[:name],
      description: params[:description],
      questions_answers: (params[:form_data] || [])
    }
  end
end