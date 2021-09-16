# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'welcome' do
    let(:user) { build(:user) }
    let(:mail) { UserMailer.welcome(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to Xodoki')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['no-reply@ganelin.club'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Welcome to Xodki')
    end
  end
end
