# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HikePolicy do
  subject { described_class.new(user, hike) }

  let(:hike) { build(:hike) }

  context 'when visitor' do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_actions(%i[create new update edit destroy hikes]) }
  end

  context 'when user' do
    let(:user) { build(:user) }

    it { is_expected.to permit_actions(%i[show create new hikes]) }
    it { is_expected.to forbid_actions(%i[update edit destroy]) }

    context 'when hike belongs to user' do
      let(:user) { hike.user }

      it { is_expected.to permit_actions(%i[update edit destroy]) }
    end
  end

  context 'when admin' do
    let(:user) { build(:user, :admin) }

    it { is_expected.to permit_actions(%i[show create new hikes update edit destroy hikes]) }
  end
end
