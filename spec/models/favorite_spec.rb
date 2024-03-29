# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:subject) { build(:favorite) }

  it { should belong_to(:user) }
  it { should belong_to(:hike) }
end
