# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create :post }

  # Validation
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(10) }

  # Assocication
  it { is_expected.to have_many(:comments) }
  it { is_expected.to belong_to(:user) }
end
