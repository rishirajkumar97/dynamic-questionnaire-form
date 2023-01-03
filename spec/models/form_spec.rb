# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Form, type: :model do
  let(:form) { %i[id] }

  describe 'Question Validations' do
    context 'validate belongs_to association' do
      it { should have_many(:questions).dependent(:destroy_async) }
      it { should have_many(:answers).dependent(:destroy_async) }
    end
  end
end
