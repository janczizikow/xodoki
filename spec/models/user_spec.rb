# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it { is_expected.to have_db_index(:email) }
  it { is_expected.to have_many(:hikes).dependent(:destroy) }
  it { is_expected.to have_many(:photos).dependent(:destroy) }
  it { is_expected.to have_db_column(:admin).of_type(:boolean).with_options(default: false) }

  it 'is invalid without email' do
    expect(build(:user, email: '')).to_not be_valid
  end

  it 'is invalid without password' do
    expect(build(:user, password: '')).to_not be_valid
  end

  it 'is invalid without username' do
    expect(build(:user, username: '')).to_not be_valid
  end

  describe 'password' do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_confirmation_of(:password) }
    it do
      expect(subject)
        .to validate_length_of(:password)
        .is_at_least(Devise.password_length.min)
        .is_at_most(Devise.password_length.max)
    end
  end
end
