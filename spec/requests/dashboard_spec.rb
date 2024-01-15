# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dashboards', type: :request do # rubocop:disable Metrics/BlockLength
  let!(:user) { create(:user) }
  let!(:move) { create(:move, user:) }

  context 'user is logged in' do
    before do
      post new_user_session_path, params: { user: { email: user.email, password: user.password } }
    end

    describe 'GET /dashboard' do

      it 'shows the dashboard to a logged in user' do
        get '/dashboard'
        expect(response).to have_http_status(:ok)
      end

      it 'renders dashboard#show' do
        get '/'
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:show)
      end
    end

    describe 'GET routes not present' do
      it 'has no index' do
        get '/dashboards/index'
        expect(response).to have_http_status(404)
      end

      it 'has no new' do
        get '/dashboard/new'
        expect(response).to have_http_status(404)
      end
    end
  end

  context 'user is not logged in' do
    it 'redirects to sign in' do
      get '/dashboard'
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'redirects to sign in' do
      get '/'
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
