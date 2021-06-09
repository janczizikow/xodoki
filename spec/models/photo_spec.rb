# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:subject) { build(:photo) }

  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:link) }

  it { should belong_to(:user) }
  it { should belong_to(:hike) }
end
