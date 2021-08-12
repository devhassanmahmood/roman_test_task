# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'Test comment for  Post' }
    association :post, factory: :post, strategy: :create
  end
end
