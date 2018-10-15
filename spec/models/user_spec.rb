# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'fails validation without username' do
    expect(User.new(attributes_for(:user).merge(username: ''))).not_to be_valid
  end

  it 'passes validation with username' do
    expect(user).to be_valid
  end
end
