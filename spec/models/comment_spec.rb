# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create :comment }

  # Validation
  it { is_expected.to validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_least(10) }
  # Assocication
  it { is_expected.to belong_to(:post) }
end
