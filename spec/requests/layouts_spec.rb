# frozen_string_literal: true

require 'rails_helper'

# Renders full pages so that a missing JavaScript bundle fails loudly:
# javascript_include_tag raises if app/assets/builds lacks the file (run `yarn build`).
RSpec.describe 'Layouts', type: :request do
  it 'renders the public layout with the application bundle and stylesheet' do
    get root_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to match(%r{/assets/application-\h+\.js})
    expect(response.body).to match(%r{/assets/application-\h+\.css})
  end

  it 'renders the page-specific bundle' do
    get root_path

    expect(response.body).to match(%r{/assets/filters-\h+\.js})
  end
end
