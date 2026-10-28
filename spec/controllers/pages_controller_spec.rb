# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home pagination' do
    # 21 hikes always means at least two pages. Other hikes may already exist (CI seeds the test
    # database with `rails db:setup`), so expectations are derived from the real total, not assumed.
    let(:per_page) { Pagy::VARS[:items] }
    let(:total) { Hike.count }
    let(:last_page) { (total / per_page.to_f).ceil }
    let(:last_page_size) { total - (per_page * (last_page - 1)) }

    before do
      user = create(:user)
      category = create(:category)
      direction = create(:direction)
      create_list(:hike, 21, name: 'Elbrus', user:, category:, direction:)
    end

    it 'shows the requested page' do
      get :home, params: {page: '2'}

      expect(response).to have_http_status(:success)
      expect(assigns(:pagy).page).to eq(2)
      expect(assigns(:hikes).size).to eq([total - per_page, per_page].min)
    end

    it 'shows the first page when no page is given' do
      get :home

      expect(assigns(:pagy).page).to eq(1)
      expect(assigns(:hikes).size).to eq(per_page)
    end

    ['-1', '0', 'abc', '1.5', '', '1; DROP TABLE hikes', '0x10', ' 2'].each do |value|
      it "falls back to the first page for page=#{value.inspect}" do
        get :home, params: {page: value}

        expect(response).to have_http_status(:success)
        expect(assigns(:pagy).page).to eq(1)
      end
    end

    it 'falls back to the last page when the page is past the end' do
      get :home, params: {page: '99999'}

      expect(response).to have_http_status(:success)
      expect(assigns(:pagy).page).to eq(last_page)
      expect(assigns(:hikes).size).to eq(last_page_size)
    end

    it 'handles a page number too large for an integer column' do
      get :home, params: {page: '9' * 30}

      expect(response).to have_http_status(:success)
      expect(assigns(:pagy).page).to eq(last_page)
    end

    # The search filters down to exactly the 21 hikes created above, whatever else is in the table
    it 'paginates search results over the whole result set' do
      get :home, params: {search: 'Elbrus', page: '2'}

      expect(response).to have_http_status(:success)
      expect(assigns(:pagy).count).to eq(21)
      expect(assigns(:pagy).page).to eq(2)
      expect(assigns(:hikes).size).to eq(1)
    end

    it 'handles a bad page together with a search' do
      get :home, params: {search: 'Elbrus', page: '-1'}

      expect(response).to have_http_status(:success)
      expect(assigns(:pagy).page).to eq(1)
      expect(assigns(:hikes).size).to eq(per_page)
    end

    it 'keeps the upcoming and past filters working with a page' do
      get :home, params: {upcoming: '1', page: '-1'}

      expect(response).to have_http_status(:success)
    end
  end
end
