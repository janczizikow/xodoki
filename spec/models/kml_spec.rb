# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Kml, type: :model do
  let(:subject) { build(:kml) }

  it { should validate_presence_of(:file) }
  it { should belong_to(:hike) }
end
