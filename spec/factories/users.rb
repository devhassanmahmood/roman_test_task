# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password { '123456' }
    password_confirmation { '123456' }
    sequence :email do |n|
      "sample#{n}@example.com"
    end
  end
end
