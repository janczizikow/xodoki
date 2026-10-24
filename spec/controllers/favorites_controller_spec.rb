# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  let(:user) { create(:user) }
  let(:hike) { create(:hike) }

  describe 'GET #index' do
    it 'returns http success for a signed in user' do
      sign_in user

      get :index

      expect(response).to have_http_status(:success)
    end

    it 'only lists the current user favorites' do
      sign_in user
      mine = create(:favorite, user:)
      create(:favorite)

      get :index

      expect(assigns(:favorites)).to contain_exactly(mine)
    end

    it 'redirects guests to the login page' do
      get :index

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST #create' do
    let(:params) { {hike_id: hike.slug, favorite: {hike_id: hike.id}} }

    it 'adds the hike to the user favorites' do
      sign_in user

      expect { post :create, params: }.to change(Favorite, :count).by(1)
      expect(response).to redirect_to(hike)
    end

    it 'does not add the same hike twice' do
      sign_in user
      create(:favorite, user:, hike:)

      expect { post :create, params: }.not_to change(Favorite, :count)
      expect(response).to redirect_to(hike)
    end

    it 'redirects guests to the login page' do
      expect { post :create, params: }.not_to change(Favorite, :count)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'DELETE #destroy' do
    let!(:favorite) { create(:favorite, user:, hike:) }
    let(:params) { {hike_id: hike.slug, id: favorite.id} }

    it 'removes the favorite' do
      sign_in user

      expect { delete :destroy, params: }.to change(Favorite, :count).by(-1)
      expect(response).to redirect_to(hike)
    end

    it "does not remove another user's favorite" do
      sign_in create(:user)

      expect { delete :destroy, params: }.not_to change(Favorite, :count)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
