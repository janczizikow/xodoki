# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FavoritePolicy do
  subject { described_class.new(user, favorite) }

  let(:favorite) { build(:favorite) }

  context 'when visitor' do
    let(:user) { nil }

    it { is_expected.to forbid_actions(%i[create destroy]) }
  end

  context 'when user' do
    let(:user) { build(:user) }

    it { is_expected.to permit_action(:create) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'when favorite belongs to user' do
    let(:user) { favorite.user }

    it { is_expected.to permit_actions(%i[create destroy]) }
  end
end
