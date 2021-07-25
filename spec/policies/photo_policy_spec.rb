# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhotoPolicy do
  subject { described_class.new(user, photo) }

  let(:photo) { build(:photo) }

  context 'when visitor' do
    let(:user) { nil }

    it { is_expected.to forbid_actions(%i[create update destroy]) }
  end

  context 'when user' do
    let(:user) { build(:user) }

    it { is_expected.to permit_action(:create) }
    it { is_expected.to forbid_actions(%i[update destroy]) }
  end

  context 'when photo belongs to user' do
    let(:user) { photo.user }

    it { is_expected.to permit_actions(%i[create update destroy]) }
  end
end
