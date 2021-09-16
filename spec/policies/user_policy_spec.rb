# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy do
  subject { described_class.new(user, other_user) }

  let(:other_user) { build(:user) }

  context 'when visitor' do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_actions(%i[create new update edit destroy account password]) }
  end

  context 'when record == user' do
    let(:user) { other_user }

    it { is_expected.to permit_actions(%i[show update edit destroy account password]) }
    it { is_expected.to forbid_actions(%i[create new]) }
  end

  context 'when admin' do
    let(:user) { build(:user, :admin) }

    it { is_expected.to permit_actions(%i[show create new update edit destroy account]) }
    it { is_expected.to forbid_action(:password) }
  end
end
