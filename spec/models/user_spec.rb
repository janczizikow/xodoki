# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is invalid without email' do
    expect(build(:user, email: '')).to_not be_valid
  end

  it 'is invalid without password' do
    expect(build(:user, password: '')).to_not be_valid
  end

  it 'is invalid without username' do
    expect(build(:user, username: '')).to_not be_valid
  end
end
