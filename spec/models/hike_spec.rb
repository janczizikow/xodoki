# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hike, type: :model do
  let(:subject) { build(:hike) }

  it { should belong_to(:user) }
  it { should belong_to(:category) }
  it { should belong_to(:direction) }

  it { should have_many(:photos).dependent(:destroy) }
  it { should have_many(:favorites).dependent(:destroy) }
  it { should have_many(:kmls).dependent(:destroy) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :date }
  it { should validate_presence_of :distance }
end
