require "rails_helper"

RSpec.describe "Moves", type: :request do
  let!(:user) { create(:user) }

  before do
    post new_user_session_path, params: { user: { email: user.email, password: user.password } }
  end

  describe "GET /" do
    it "redirects to /movews/new when no move" do
      expect(user.moves).to be_blank

      get "/"
      expect(response).to have_http_status(:redirect)
      expect(response.headers["location"]).to include("moves/new")
    end
  end

  describe "GET /moves#index" do
    it "shows index for moves" do
      get "/moves"
      expect(response).to have_http_status(:ok)
    end
  end
end
