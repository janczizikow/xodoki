# frozen_string_literal: true

require 'rails_helper'

# Administrate 1.0 replaced the whole admin front end, so these cover each admin resource.
RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:user, :admin) }
  let!(:hike) { create(:hike) }
  let!(:page_record) { create(:page, title: 'About', in_header: true) }

  context 'as an admin' do
    before { sign_in admin }

    it 'lists every resource' do
      %i[
        admin_users_path admin_categories_path admin_directions_path admin_hikes_path admin_pages_path
      ].each do |name|
        get public_send(name)

        expect(response).to have_http_status(:ok), "#{name}: #{response.status} #{response.location}"
      end
    end

    it 'shows and edits a hike by its friendly id' do
      get admin_hike_path(hike.slug)
      expect(response).to have_http_status(:ok)

      get edit_admin_hike_path(hike.slug)
      expect(response).to have_http_status(:ok)
    end

    it 'renders the rich text editor for pages' do
      get new_admin_page_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('trix-editor')
    end

    it 'creates a page with rich text content' do
      params = {page: {title: 'Contacts', content: '<div>Hello</div>', in_footer: '1'}}
      post(admin_pages_path, params:)

      page = Page.find_by!(title: 'Contacts')
      expect(response).to redirect_to(admin_page_path(page))
      expect(page.content.to_plain_text).to eq('Hello')
      expect(page.in_footer).to be(true)
    end

    it 'updates a page' do
      patch admin_page_path(page_record.slug), params: {page: {in_header: '0'}}

      expect(page_record.reload.in_header).to be(false)
    end

    it 'updates a user without changing the password when it is left blank' do
      user = create(:user, password: 'old-password')

      patch admin_user_path(user), params: {user: {username: 'Renamed', password: ''}}

      expect(user.reload.username).to eq('Renamed')
      expect(user.valid_password?('old-password')).to be(true)
    end

    it 'deletes a category' do
      category = create(:category)

      expect { delete admin_category_path(category) }.to change(Category, :count).by(-1)
    end
  end

  it 'redirects non-admin users away' do
    sign_in create(:user)

    get admin_root_path

    expect(response).to redirect_to(root_path)
  end

  it 'redirects guests to the login page' do
    get admin_root_path

    expect(response).to redirect_to(new_user_session_path)
  end
end
