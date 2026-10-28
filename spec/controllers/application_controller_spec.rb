# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    skip_before_action :authenticate_user!
    skip_after_action :verify_policy_scoped

    def index
      head :ok
    end
  end

  describe 'Sentry context' do
    let(:scope) { Sentry.get_current_scope }

    it 'records the url and the current user id' do
      user = create(:user)
      sign_in user

      get :index

      expect(scope.user).to eq(id: user.id)
      expect(scope.extra[:url]).to eq('http://test.host/anonymous')
    end

    it 'never sends unfiltered params (the SDK does not scrub extras)' do
      get :index, params: {password: 'secret', q: 'visible'}

      expect(scope.extra[:params]).to include('q' => 'visible', 'password' => '[FILTERED]')
    end
  end
end
