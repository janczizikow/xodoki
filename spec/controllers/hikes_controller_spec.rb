# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HikesController, type: :controller do
  let(:user) { create(:user) }
  let(:hike) { create(:hike, user:) }
  let(:valid_attributes) do
    {
      name: 'Elbrus',
      description: 'A long walk',
      date: 1.week.from_now.to_date,
      distance: 12,
      category_id: create(:category).id,
      direction_id: create(:direction).id
    }
  end

  describe 'GET #show' do
    it 'is public' do
      get :show, params: {id: hike.slug}

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success for a signed in user' do
      sign_in user

      get :new

      expect(response).to have_http_status(:success)
    end

    it 'redirects guests to the login page' do
      get :new

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST #create' do
    it 'creates a hike owned by the current user' do
      sign_in user

      expect { post :create, params: {hike: valid_attributes} }.to change(Hike, :count).by(1)
      expect(Hike.last.user).to eq(user)
      expect(response).to redirect_to(Hike.last)
    end

    it 're-renders the form when the hike is invalid' do
      sign_in user

      expect do
        post :create, params: {hike: valid_attributes.merge(name: '')}
      end.not_to change(Hike, :count)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end

    it 'redirects guests to the login page' do
      expect { post :create, params: {hike: valid_attributes} }.not_to change(Hike, :count)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #edit' do
    it 'returns http success for the owner' do
      sign_in user

      get :edit, params: {id: hike.slug}

      expect(response).to have_http_status(:success)
    end

    it 'does not let other users edit the hike' do
      sign_in create(:user)

      get :edit, params: {id: hike.slug}

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'PATCH #update' do
    it 'updates the hike' do
      sign_in user

      patch :update, params: {id: hike.slug, hike: {description: 'Updated'}}

      expect(hike.reload.description).to eq('Updated')
      expect(response).to redirect_to(hike)
    end

    it 're-renders the form when the hike is invalid' do
      sign_in user

      patch :update, params: {id: hike.slug, hike: {name: ''}}

      expect(response).to render_template(:edit)
      expect(hike.reload.name).not_to be_blank
    end

    it 'does not let other users update the hike' do
      sign_in create(:user)

      patch :update, params: {id: hike.slug, hike: {description: 'Updated'}}

      expect(hike.reload.description).not_to eq('Updated')
    end
  end

  describe 'DELETE #destroy' do
    it 'removes the hike' do
      sign_in user
      hike

      expect { delete :destroy, params: {id: hike.slug} }.to change(Hike, :count).by(-1)
      expect(response).to redirect_to(root_path)
    end

    it 'lets an admin remove any hike' do
      sign_in create(:user, :admin)
      hike

      expect { delete :destroy, params: {id: hike.slug} }.to change(Hike, :count).by(-1)
    end

    it 'does not let other users remove the hike' do
      sign_in create(:user)
      hike

      expect { delete :destroy, params: {id: hike.slug} }.not_to change(Hike, :count)
    end
  end
end
