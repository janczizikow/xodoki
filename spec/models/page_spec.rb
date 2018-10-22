# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:page) { build(:page) }

  it 'is invalid without title' do
    expect(build(:page, title: '')).to_not be_valid
  end

  it 'is invalid without content' do
    expect(build(:page, content: '')).to_not be_valid
  end

  it 'has a slug after create' do
    expect(build(:page).slug).to be_truthy
  end
end
