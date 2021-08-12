# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'Test Post' }
    description { 'This is a test description' }
    association :user, factory: :user, strategy: :create
  end
end
