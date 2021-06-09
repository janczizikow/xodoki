# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:subject) { build(:page) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title).case_insensitive }
  it { should validate_presence_of(:content) }
  it { should have_rich_text(:content) }
end
