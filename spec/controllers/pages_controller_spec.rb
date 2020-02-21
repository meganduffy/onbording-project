require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET #home' do
    context 'when viewing homepage in the browser' do
      it 'returns a 200 OK response' do
        (expect(response.status).to eq(200))
      end
    end
  end
end
