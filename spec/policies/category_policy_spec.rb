# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryPolicy, type: :policy do
  subject { described_class.new(user, category) }

  let(:category) { build(:category) }

  context 'when visitor' do
    let(:user) { nil }

    it { is_expected.to forbid_actions(%i[index show create new update edit destroy]) }
  end

  context 'when user' do
    let(:user) { build(:user) }

    it { is_expected.to forbid_actions(%i[index show create new update edit destroy]) }
  end

  context 'when admin' do
    let(:user) { build(:user, :admin) }

    it { is_expected.to permit_actions(%i[index show create new update edit destroy]) }
  end
end
