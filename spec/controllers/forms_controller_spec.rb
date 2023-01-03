# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FormsController, type: :controller do
  let(:form_mock) { FactoryBot.attributes_for(:form_mock) }
  let(:post_params_mock) { FactoryBot.attributes_for(:post_params_mock) }
  let(:valid_params) { FactoryBot.attributes_for(:id_params) }
  let(:form) { double(:form, form_mock) }
  let(:post_params) do
    {
      "name": 'Test Form New',
      "description": 'Test Description',
      "form_data": {
        "name": 'Test QN 1',
        "answer_type": 1.to_i,
        "answers": [
          {
            "value": 'test Child',
            "name": 'Test Qn 0 Value',
            "answer_type": 1.to_i,
            "answers": [
              {
                "value": 'Test Sub Child',
                "name": 'Test Qn Sub Child Value',
                "answer_type": 1.to_i
              }
            ]
          }
        ]
      }
    }
  end

  # TODO: Form Create Spec for #create method
  # To Validate Form Created / Question Created / Answer Created

  describe '#create' do
    context 'when request params are valid' do
      it 'returns newly created form' do
        post :create, params: post_params.as_json
        expect(response.status).to eq 201
        form_id = JSON.parse(response.body)['id']
        form = Form.find_by(id: form_id)
        # Assert newly created question count and answer count
        expect(form.questions.count).to eq(2)
        expect(form.answers.count).to eq(2)
      end
    end
  end

  describe '#index' do
    subject { get :index, params: {} }

    before do
      allow(Form).to \
        receive(:all).and_return([form])
    end

    context 'when request params are valid' do
      it 'returns list of forms' do
        subject
        expect(response.status).to eq 200
        response_body = JSON.parse(response.body)
        expect(response_body['count']).to eq(1)
      end
    end
  end

  describe '#show' do
    context 'when request params are valid' do
      before do
        allow(Form).to \
          receive(:find_by!)
          .and_return(form)
      end
      it 'returns form' do
        get :show, params: valid_params
        expect(response.status).to eq 200
      end
    end
    context 'when show! method raises error' do
      before do
        allow(Form).to \
          receive(:find_by!)
          .and_return(form)
        allow(form).to receive(:as_json).and_raise(ActiveRecord::RecordNotFound)
      end
      it 'returns 404 error' do
        get :show, params: valid_params
        expect(response.status).to eq 404
      end
    end
  end

  describe '#destroy' do
    context 'when request params are valid' do
      before do
        allow(Form).to \
          receive(:find_by!)
          .and_return(form)
        allow(form).to receive(:destroy!).and_return(true)
      end
      it 'returns head for delete form' do
        delete :destroy, params: valid_params
        expect(response.status).to eq 204
      end
    end
    context 'when destroy! method raises error' do
      before do
        allow(Form).to \
          receive(:find_by!)
          .and_return(form)
        allow(form).to receive(:destroy!).and_raise(ActiveRecord::RecordNotFound)
      end
      it 'returns 404 error' do
        delete :destroy, params: valid_params
        expect(response.status).to eq 404
      end
    end
  end
end
