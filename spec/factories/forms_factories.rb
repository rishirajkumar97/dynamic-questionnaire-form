

# frozen_string_literal: true

FactoryBot.define do
  factory :form_mock, class: Hash do
    id { SecureRandom.uuid }
    name { 'Test Form' }
    description { 'Test Description' }
    created_at { Time.now.utc.to_s }
    updated_at { Time.now.utc.to_s }
  end
  factory :post_params_mock, class: Hash do
    name { 'tea' }
    units { '10' }
  end

  factory :put_data, class: Hash do
    id { SecureRandom.uuid }
    units { 20 }
  end

  factory :id_params, class: Hash do
    id { SecureRandom.uuid }
  end
end