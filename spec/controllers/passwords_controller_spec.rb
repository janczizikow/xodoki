# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  let(:user) { create(:user, password: 'old-password') }
  let(:params) do
    {
      id: user.id,
      user: {
        current_password: 'old-password',
        password: 'new-password',
        password_confirmation: 'new-password'
      }
    }
  end

  describe 'PATCH #update' do
    it 'changes the password and keeps the user signed in' do
      sign_in user

      patch :update, params: params

      expect(user.reload.valid_password?('new-password')).to be(true)
      expect(response).to redirect_to(account_password_path)
    end

    it 'rejects a wrong current password' do
      sign_in user
      params[:user][:current_password] = 'wrong'

      patch :update, params: params

      expect(user.reload.valid_password?('old-password')).to be(true)
      expect(response).to render_template('account/password')
    end

    it 'rejects a mismatched confirmation' do
      sign_in user
      params[:user][:password_confirmation] = 'different'

      patch :update, params: params

      expect(user.reload.valid_password?('old-password')).to be(true)
      expect(response).to render_template('account/password')
    end

    it 'redirects guests to the login page' do
      patch :update, params: params

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
