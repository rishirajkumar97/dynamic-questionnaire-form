# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { %i[id] }

  describe 'Question Validations' do
    context 'validate belongs_to association' do
      it { should belong_to(:form) }
      it { should have_many(:answers) }
      it { should accept_nested_attributes_for(:answers) }
    end
  end
end
