require "rails_helper"

RSpec.describe "Opportunities", type: :request do
  let!(:user) { create(:user) }
  let!(:move) { create(:move, user:) }

  describe 'GET /opportunities' do

    before do
      post new_user_session_path, params: { user: { email: user.email, password: user.password } }
    end

    context "GET /index" do
      it "lists opportunities" do
        get "/opportunities"
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
