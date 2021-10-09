require 'rails_helper'

RSpec.describe "/repositories", type: :request do

  describe 'GET /index' do
    it 'renders a successful response' do
      get repositories_url
      expect(response).to be_successful
    end

    it 'renders input box only when no query string passed' do
      get repositories_url
      expect(response).to be_successful
      expect(response.body).to include('<input type="text" name="q" id="q"')
      expect(response.body).not_to include('class="repo-section"')
    end

    it 'renders results when query string is passed' do
      get repositories_url, params: {q: "github"}
      expect(response).to be_successful
      expect(response.body).to include('<input type="text" name="q" id="q"')
      expect(response.body).to include('class="repo-section"')
    end
  end
end




