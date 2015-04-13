require 'rails_helper'

RSpec.describe SessionsController do
  describe 'GET #new' do
    context 'when logged out' do
      before { get :new }

      it 'it returns a 307 redirect' do
        expect(response).to be_redirect
        expect(response).to have_http_status(307)
      end

      it 'is redirects to the OAuth endpoint' do
        expect(response.redirect_url).to match(/github.com/)
      end
    end

    context 'when logged in' do
      xit 'it returns a 404' do
        get :new

        expect(response).to be_not_found
      end
    end
  end

  describe 'GET #create' do
    context 'when logged out' do
      before { get :create }

      it 'sets the session token' do
        expect(request.session[:access_token]).not_to be_nil
      end

      it 'redirects to the root page' do
        expect(response).to be_redirect
      end
    end
  end
end
