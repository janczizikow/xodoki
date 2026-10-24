# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  let(:user) { create(:user) }
  let(:hike) { create(:hike) }

  describe 'POST #create' do
    let(:params) { {hike_id: hike.slug, photo: {text: 'Summit', link: 'https://example.com/photo.jpg'}} }

    it 'adds a photo link to the hike' do
      sign_in user

      expect { post :create, params: }.to change(hike.photos, :count).by(1)
      expect(hike.photos.last.user).to eq(user)
      expect(response).to redirect_to(hike)
    end

    it 'does not add a photo with an invalid link' do
      sign_in user
      params[:photo][:link] = 'not a link'

      expect { post :create, params: }.not_to change(Photo, :count)
      expect(flash[:alert]).to be_present
      expect(response).to redirect_to(hike)
    end

    it 'redirects guests to the login page' do
      expect { post :create, params: }.not_to change(Photo, :count)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'DELETE #destroy' do
    let!(:photo) { create(:photo, user:, hike:) }
    let(:params) { {hike_id: hike.slug, id: photo.id} }

    it 'removes the photo' do
      sign_in user

      expect { delete :destroy, params: }.to change(Photo, :count).by(-1)
      expect(response).to redirect_to(hike)
    end

    it "does not remove another user's photo" do
      sign_in create(:user)

      expect { delete :destroy, params: }.not_to change(Photo, :count)
    end
  end
end
