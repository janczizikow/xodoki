# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:subject) { build(:category) }

  it { should have_many(:hikes) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end
