# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:subject) { build(:page) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title).case_insensitive }
  it { should validate_presence_of(:content) }
  it { should have_rich_text(:content) }

  # Rich text embeds go through Active Storage, which needs its schema up to date
  it 'stores Active Storage blobs for rich text attachments' do
    blob = ActiveStorage::Blob.create_and_upload!(
      io: StringIO.new('hello'), filename: 'a.txt', content_type: 'text/plain'
    )

    expect(blob.service_name).to be_present
  end
end
