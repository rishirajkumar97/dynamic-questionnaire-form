# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { %i[id] }

  describe 'Answer Validations' do
    context 'validate belongs_to association' do
      it { should belong_to(:question) }
      it { should belong_to(:next_question) }
    end
  end
end
